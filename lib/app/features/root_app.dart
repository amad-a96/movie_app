import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/bindings/initial_di.dart';
import '../core/constant/configs.dart';
import '../core/constant/theme_manager.dart';
import '../core/localization/translation_controller.dart';
import '../core/localization/translation_manager.dart';
import '../routing/pages.dart';
import '../routing/path.dart';

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);

  final _config = Get.put(Configs());

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(TranslationController()); //to lifeCycle

    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        // builder: DevicePreview.appBuilder,
        title: Configs.to.appName,
        locale: languageController.language ?? Locale(_config.english),
        fallbackLocale: Locale(_config.english),
        translations: TranslationManager(),
        theme: ThemeManager.themeDarkEng,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
        initialRoute: Paths.splash,
        getPages: Pages.getPages,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
