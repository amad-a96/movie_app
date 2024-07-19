import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/core/services/storage_services.dart';
import 'app/features/root_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
       statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,));

  await initialService();
  runApp(
    // DevicePreview(
    //   builder: (context) =>
    RootApp(),
    // ),
  );
}

initialService() async {

  await Get.putAsync(() => StorageService().init());
}
