import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrintReceiptScreenController extends GetxController {
  late WebViewController webController;

  // URL of the receipt PDF
  final String url =
      "https://britbite.com/assets/front/invoices/product/bCOk1733950877.pdf";

  void setWebController(WebViewController controller) {
    webController = controller;
  }

  void printReceipt() {
    // Run JavaScript to invoke the browser's print dialog
    webController.runJavaScript("window.print();");
  }
}
