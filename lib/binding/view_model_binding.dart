import 'package:britbite/screens/print_receipt_screen/controller/print_receipt_screen_controller.dart';
import 'package:get/get.dart';

import '../screens/company_screens/controller/companylist_controller.dart';
import '../screens/splash_screens/controller/splash_controller.dart';
import '../screens/web_view/controller/web_view_screen_controller.dart';



class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<CompanylistController>(() => CompanylistController(), fenix: true);
    Get.lazyPut<PrintReceiptScreenController>(() => PrintReceiptScreenController(), fenix: true);
    Get.lazyPut<WebViewScreenController>(() => WebViewScreenController(), fenix: true);
    // Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    // Get.lazyPut<MailOtpController>(() => MailOtpController(), fenix: true);
    // Get.lazyPut<PhoneOtpController>(() => PhoneOtpController(), fenix: true);
    // Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
    // Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    // Get.lazyPut<MyAccountController>(() => MyAccountController(), fenix: true);
    // Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    // Get.lazyPut<HomeScreenController>(() => HomeScreenController(), fenix: true);
    // Get.lazyPut<NotificationController>(() => NotificationController(), fenix: true);
    // Get.lazyPut<AccountController>(() => AccountController(), fenix: true);
    // Get.lazyPut<SupportScreenController>(() => SupportScreenController(), fenix: true);
    // Get.lazyPut<MoreScreenController>(() => MoreScreenController(), fenix: true);
    // Get.lazyPut<BuyTripPassScreenController>(() => BuyTripPassScreenController(), fenix: true);
    // Get.lazyPut<MyAccountController>(() => MyAccountController(), fenix: true);
    // Get.lazyPut<MyGalleryController>(() => MyGalleryController(), fenix: true);
    // Get.lazyPut<MyVehiclesController>(() => MyVehiclesController(), fenix: true);
    // Get.lazyPut<UsagesHistoryScreenController>(() => UsagesHistoryScreenController(), fenix: true);
    // Get.lazyPut<RegisterForNewVehicleController>(() => RegisterForNewVehicleController(), fenix: true);
    // Get.lazyPut<QrCodeCollectionController>(() => QrCodeCollectionController(), fenix: true);
    // Get.lazyPut<WebViewScreenController>(() => WebViewScreenController(), fenix: true);
    //Get.put(UserDi());
    // Get.put(NotificationControllerForApp());
  }
}