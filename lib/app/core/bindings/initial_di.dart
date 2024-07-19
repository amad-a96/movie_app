import 'package:get/get.dart';

import '../controllers/network_checker_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkCheckerController());
  }
}
