import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  // final StorageService _storage = Get.find<StorageService>();
  // final Configs _config = Get.find<Configs>();

  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
