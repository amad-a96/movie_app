import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class TemplateBinding implements Bindings {
  @override
  void dependencies() {
    //controllers
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
