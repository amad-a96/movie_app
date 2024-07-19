import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/color_manager.dart';
import '../../localization/strings.dart';

class CustomSnackBar {
  static showCustomSnackBar(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: ColorManager.white,
      backgroundColor: ColorManager.green.withOpacity(0.9),
      icon: Icon(
        Icons.check_circle,
        color: ColorManager.white,
      ),
    );
  }

  static showCustomSuccessSnackBar(
      {String? title, required String message, Duration? duration}) {
    Get.snackbar(
      title ?? Strings.success.tr,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: ColorManager.white,
      backgroundColor: ColorManager.darkGreen.withOpacity(0.7),
      icon: Icon(
        Icons.check_circle,
        color: ColorManager.white,
      ),
    );
  }

  static showCustomErrorSnackBar(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      title ?? Strings.error.tr,
      message,
      duration: duration ?? const Duration(seconds: 8),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: ColorManager.white,
      backgroundColor: color ?? ColorManager.red3.withOpacity(0.7),
      icon: Icon(
        Icons.error,
        color: ColorManager.white,
      ),
    );
  }

  static showCustomNoInternetSnackBar(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      isDismissible: false,
      title ?? Strings.error.tr,
      message,
      duration: duration ?? const Duration(days: 8),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: ColorManager.white,
      backgroundColor: color ?? ColorManager.black.withOpacity(0.9),
      icon: Icon(
        Icons.signal_wifi_connected_no_internet_4_outlined,
        color: ColorManager.white,
      ),
    );
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static showCustomErrorToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
