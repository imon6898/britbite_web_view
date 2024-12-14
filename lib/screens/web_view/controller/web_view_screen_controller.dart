import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';

class WebViewScreenController extends GetxController {
  late WebViewController webController;
  bool isLoading = true;
  String title = '';
  String url = '';

  @override
  void onInit() {
    super.onInit();

    // Fetch arguments passed to this screen
    title = Get.arguments[0];
    url = Get.arguments[1];

    // Initialize WebViewController with required configurations
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading = true;
            update();
          },
          onPageFinished: (String url) {
            isLoading = false;
            _injectClickTracker(); // Inject JavaScript to handle custom logic
            update();
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )
      ..addJavaScriptChannel(
        'HtmlExtractor',
        onMessageReceived: (JavaScriptMessage message) async {
          await _handleHtmlExtraction(message.message);
        },
      )
      ..loadRequest(Uri.parse(url));
  }

  /// Handle back navigation within the WebView
  Future<bool> onBackPressed() async {
    final canGoBack = await webController.canGoBack();
    if (canGoBack) {
      webController.goBack();
      return false; // Stay on the same screen
    } else {
      return true; // Exit the WebView screen
    }
  }

  /// Inject JavaScript to track button clicks and media events
  void _injectClickTracker() {
    webController.runJavaScript('''
      document.querySelectorAll('button').forEach(button => {
        button.addEventListener('click', () => {
          const buttonText = button.innerText || 'Unnamed Button';
          if (window.ButtonClickTracker) {
            ButtonClickTracker.postMessage(buttonText);
          }
        });
      });
    ''');
  }

  /// Print receipt (extract HTML and print PDF in one step)
  Future<void> printReceipt() async {
    isLoading = true;
    update();

    // Extract HTML content
    await webController.runJavaScript(
      '''
      const htmlContent = document.documentElement.outerHTML;
      if (window.HtmlExtractor) {
        HtmlExtractor.postMessage(htmlContent);
      }
      ''',
    );
  }

  /// Handle extracted HTML content
  Future<void> _handleHtmlExtraction(String htmlContent) async {
    debugPrint("Extracted HTML Content: $htmlContent");

    // Extract the PDF URL from the HTML
    final RegExp regex = RegExp(r'https?://[^\s<>"]+\.pdf');
    final match = regex.firstMatch(htmlContent);

    if (match != null) {
      final extractedPdfUrl = match.group(0); // Save the extracted PDF URL
      debugPrint("Extracted PDF URL: $extractedPdfUrl");

      // Automatically fetch and print the PDF
      await _fetchAndPrintPdf(extractedPdfUrl!);
    } else {
      debugPrint("No PDF URL found in HTML.");
      Get.snackbar("Error", "No PDF URL found in HTML.");
      isLoading = false;
      update();
    }
  }


  /// Fetch and print PDF from a given URL
  Future<void> _fetchAndPrintPdf(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await Printing.layoutPdf(onLayout: (_) => response.bodyBytes);
        Get.snackbar("Success", "PDF sent to printer!");
      } else {
        debugPrint("Failed to fetch PDF: ${response.statusCode}");
        Get.snackbar("Error", "Failed to fetch the PDF file.");
      }
    } catch (e) {
      debugPrint("Error fetching PDF: $e");
      Get.snackbar("Error", "An error occurred while fetching the PDF.");
    }
  }
}
