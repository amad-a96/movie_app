import 'package:get/get.dart';
import 'package:movie_app/app/core/controllers/network_checker_controller.dart';
import 'package:movie_app/app/routing/path.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    once(
      NetworkCheckerController.to.networkInfo,
      (networkInfo) async {
        Get.toNamed(Paths.home);
      },
    );
  }
}
