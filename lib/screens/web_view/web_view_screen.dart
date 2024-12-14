import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/web_view_screen_controller.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebViewScreenController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: controller.onBackPressed,
          child: SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  WebViewWidget(controller: controller.webController),
                  if (controller.isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                heroTag: "print",
                onPressed: () async {
                  await controller.printReceipt();
                },
                child: const Icon(Icons.print),
                tooltip: 'Print Receipt',
              ),
            ),
          ),
        );
      },
    );
  }
}
