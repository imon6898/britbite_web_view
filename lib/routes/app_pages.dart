import 'package:britbite/screens/web_view/web_view_screen.dart';
import 'package:get/get.dart';
import '../screens/splash_screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.WebViewScreen,
      page: () => WebViewScreen(),
    ),


  ];
}
