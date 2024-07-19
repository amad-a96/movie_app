import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResponsiveBreakpoint {
  static const mobile = 420;
  static const tablet = 768;
  static const desktop = 1100;
  static const xl = 1650;

  static isMobile() {
    if (Get.width <= mobile) {
      return true;
    }
    return false;
  }

  isTablet() {
    if (Get.width <= tablet) {
      return true;
    }
    return false;
  }

  isdesktop() {
    if (Get.width <= desktop) {
      return true;
    }
    return false;
  }

  isXL() {
    if (Get.width <= xl) {
      return true;
    }
    return false;
  }
}
