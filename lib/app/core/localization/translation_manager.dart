
import 'package:get/get.dart';

import '../constant/configs.dart';
import 'ar/ar_translation.dart';
import 'en/en_translation.dart';
import 'ku/ku_translation.dart';

class TranslationManager extends Translations {
  final _config = Get.find<Configs>();
  @override
  Map<String, Map<String, String>> get keys => {
        _config.arabic: ar,
        _config.english: en,
        _config.kurdish: ku,
      };
}
