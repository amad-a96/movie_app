import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/core/services/dio_services.dart';
import 'app/core/services/storage_services.dart';
import 'app/features/root_app.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  await Get.putAsync(() => DioService().init());
}
