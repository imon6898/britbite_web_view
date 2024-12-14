import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/print_receipt_screen_controller.dart';

class PrintReceiptScreen extends StatelessWidget {
  const PrintReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrintReceiptScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Print Receipt"),
          actions: [
            IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                // Trigger print functionality
                controller.printReceipt();
              },
            ),
          ],
        ),
        body: WebViewWidget(controller: controller.webController),
      );
    });
  }
}
