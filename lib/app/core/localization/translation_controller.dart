import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/configs.dart';
import '../services/storage_services.dart';
import 'package:timeago/timeago.dart' as timeago;

class TranslationController extends GetxController {
  static TranslationController get to => Get.find();
  final _storege = Get.find<StorageService>();
  final _config = Get.find<Configs>();

  Locale? language;
  late bool isLanguageSeted;
  // String? get languageCode => language.languageCode;

  void changeLang(String langcode) {
    Locale locale = Locale(langcode);
    _storege.write(_config.language, langcode);
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    var theLang = _storege.read(_config.language);
    if (theLang == _config.arabic) {
      language = Locale(_config.arabic);
      isLanguageSeted = true;
      timeago.setLocaleMessages(_config.arabic, timeago.ArMessages());
      debugPrint('arab language');
    } else if (theLang == _config.english) {
      language = Locale(_config.english);
      isLanguageSeted = true;
      timeago.setLocaleMessages(_config.arabic, timeago.EnMessages());
      debugPrint('english language');
    } else if (theLang == _config.kurdish) {
      language = Locale(_config.kurdish);
      isLanguageSeted = true;
      timeago.setLocaleMessages(_config.kurdish, timeago.ArMessages());
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      isLanguageSeted = false;
      timeago.setLocaleMessages(_config.kurdish, timeago.EnMessages());
      debugPrint('device language');
    }
    super.onInit();
  }
}

// // class TranslationController extends GetxController {
// //   final _storage = Get.find<StorageService>();

// //   var langLocal = Config.english;

// //   //Language

// //   @override
// //   void onInit() async {
// //     super.onInit();
// //     langLocal = await getLanguage;
// //   }

// //   saveLanguage(String lang) async {
// //     await _storage.write(Config.language, lang);
// //   }

// //   Future<String> get getLanguage async {
// //     return await _storage.read(Config.language);
// //   }

// //   void changeLanguage(String typeLang) {
// //     saveLanguage(typeLang);
// //     if (langLocal == typeLang) {
// //       return;
// //     }

// //     if (typeLang == Config.english) {
// //       langLocal = Config.english;
// //       saveLanguage(Config.english);
// //     } else if (typeLang == Config.arabic) {
// //       langLocal = Config.arabic;
// //       saveLanguage(Config.arabic);
// //     } else if (typeLang == Config.kurdish) {
// //       langLocal = Config.kurdish;
// //       saveLanguage(Config.kurdish);
// //     } else {
// //       Locale(Get.deviceLocale!.languageCode);
// //     }
// //     update();
// //   }
// // }
