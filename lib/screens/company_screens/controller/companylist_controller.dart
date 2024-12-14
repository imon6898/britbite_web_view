import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanylistController extends GetxController with GetTickerProviderStateMixin {
  final List<Map<String, String>> companies = [
    {"name": "Brit-bite", "location": "London, UK", "url": "https://britbite.com/"},
    {"name": "Brit-bite Admin", "location": "London, UK", "url": "https://britbite.com/admin"},
    {"name": "Brit-bite User", "location": "London, UK", "url": "https://britbite.com/user/login"},
    {"name": "Fastifo", "location": "London, UK", "url": "http://fastifo.xyz/"},
    // {"name": "Future Corp", "location": "London, UK", "url": "https://futurecorp.com"}
  ];
}
