import 'package:britbite/screens/web_view/web_view_screen.dart';
import 'package:get/get.dart';
import '../screens/company_screens/companylist_screen.dart';
import '../screens/print_receipt_screen/print_receipt_screen.dart';
import '../screens/splash_screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.CompanylistScreen,
      page: () => CompanylistScreen(),
    ),

    GetPage(
      name: AppRoutes.WebViewScreen,
      page: () => WebViewScreen(),
    ),

    GetPage(
      name: AppRoutes.PrintReceiptScreen,
      page: () => PrintReceiptScreen(),
    ),


  ];
}
