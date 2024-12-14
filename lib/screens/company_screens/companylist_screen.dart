import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/companylist_controller.dart';

class CompanylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanylistController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Company List",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue[50]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            itemCount: controller.companies.length,
            itemBuilder: (context, index) {
              final company = controller.companies[index];
              return CompanyCard(
                name: company['name']!,
                location: company['location']!,
                onTap: () {
                  Get.offAllNamed(
                    'AppRoutes.WebViewScreen',
                    arguments: ["webView".tr, company['url']],
                  );
                },
              );
            },
          ),
        ),
      );
    });
  }
}

class CompanyCard extends StatelessWidget {
  final String name;
  final String location;
  final VoidCallback onTap;

  CompanyCard({required this.name, required this.location, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
              child: Icon(
                Icons.business,
                size: 30,
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
