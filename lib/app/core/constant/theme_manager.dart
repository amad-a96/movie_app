import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../services/storage_services.dart';
import 'color_manager.dart';
import 'configs.dart';

class ThemeManager {
  static ThemeData themeLightEng = ThemeData(
    useMaterial3: false,
    fontFamily: fontNameEng,

    primaryColor: ColorManager.primary,

    // backgroundColor: ColorManager.background,
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme: AppBarTheme(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      color: Colors.white,
      titleTextStyle: TextStyle(
        fontFamily: fontNameEng,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: ColorManager.black,
      ),
      shadowColor: ColorManager.lightGrey,
      elevation: 1,
      iconTheme: IconThemeData(color: ColorManager.primary),
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorManager.primary,
        secondary: ColorManager.saleHot,
        onSecondary: ColorManager.saleHot,
        background: ColorManager.background),

    inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // fillColor: ColorManager.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        labelStyle: TextStyle(
          fontSize: 14,
          color: ColorManager.darkerGrey3.withOpacity(0.8),

          // Color(0xFFA7A7A7),
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: ColorManager.darkerGrey3.withOpacity(0.8),

          // Color(0xFFA7A7A7)

          //  ColorManager.gray,
        ),
        counterStyle: Get.textTheme.titleSmall,
        border: InputBorder.none),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          ColorManager.primaryBlack,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamilySelector(),
            fontWeight: FontWeight.w500,
            color: ColorManager.white,
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5.0),
        shadowColor: MaterialStateProperty.all<Color>(ColorManager.primary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 16,
              fontFamily: fontFamilySelector(),
              fontWeight: FontWeight.w500,
              color: ColorManager.black,
            ),
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: ColorManager.primaryBlack,
                );
              }
              return BorderSide(
                color: ColorManager.primaryBlack,
              );
            },
          )),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
      selectedItemColor: ColorManager.primary,
      elevation: 5,
      unselectedItemColor: ColorManager.grey,
      backgroundColor: ColorManager.white,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ColorManager.white),
      fillColor: MaterialStateProperty.all(ColorManager.primary),
    ),
    dividerColor: ColorManager.lightGrey,

    textTheme: TextTheme(
      //headline
      headlineLarge: TextStyle(
          fontSize: 34, color: ColorManager.black, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: 28, color: ColorManager.black, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: 24, color: ColorManager.black, fontWeight: FontWeight.w600),

      //title
      titleLarge: TextStyle(
          fontSize: 22, color: ColorManager.black, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontSize: 18,
          color: ColorManager.black,
          fontWeight: FontWeight.w500), // category title etc ..
      titleSmall: TextStyle(
          fontSize: 14, color: ColorManager.black, fontWeight: FontWeight.w500),

      //body
      bodyLarge: TextStyle(
          fontSize: 16,
          color: ColorManager.black,
          fontWeight: FontWeight.w700), // product titles etc..
      bodyMedium: TextStyle(
          fontSize: 14,
          color: ColorManager.black,
          fontWeight: FontWeight.w500), // discount number etc...
      bodySmall: TextStyle(
          fontSize: 11,
          color: ColorManager.black,
          fontWeight: FontWeight.normal), //for buttons

      //label
      labelLarge: TextStyle(
          fontSize: 14,
          color: ColorManager.black,
          fontWeight: FontWeight.normal),
      labelMedium: TextStyle(
          fontSize: 12,
          color: ColorManager.black,
          fontWeight: FontWeight.normal),
      labelSmall: TextStyle(
          fontSize: 11,
          color: ColorManager.grey,
          fontWeight: FontWeight.w400), //section label
    ),
  );

  static ThemeData themeDarkEng = ThemeData(
    useMaterial3: false,
    fontFamily: fontNameEng,

    primaryColor: ColorManager.primary,

    // backgroundColor: ColorManager.background,
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme: AppBarTheme(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      color: Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: fontNameEng,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: ColorManager.white,
      ),
      shadowColor: ColorManager.lightGrey,
      elevation: 1,
      iconTheme: IconThemeData(color: ColorManager.primary),
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorManager.primary,
        secondary: ColorManager.saleHot,
        onSecondary: ColorManager.saleHot,
        background: ColorManager.background),

    inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // fillColor: ColorManager.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        labelStyle: TextStyle(
          fontSize: 14,
          color: ColorManager.darkerGrey3.withOpacity(0.8),

          // Color(0xFFA7A7A7),
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: ColorManager.darkerGrey3.withOpacity(0.8),

          // Color(0xFFA7A7A7)

          //  ColorManager.gray,
        ),
        counterStyle: Get.textTheme.titleSmall,
        border: InputBorder.none),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          ColorManager.primaryBlack,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamilySelector(),
            fontWeight: FontWeight.w500,
            color: ColorManager.white,
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5.0),
        shadowColor: MaterialStateProperty.all<Color>(ColorManager.primary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 16,
              fontFamily: fontFamilySelector(),
              fontWeight: FontWeight.w500,
              color: ColorManager.black,
            ),
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: ColorManager.primaryBlack,
                );
              }
              return BorderSide(
                color: ColorManager.primaryBlack,
              );
            },
          )),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
      selectedItemColor: ColorManager.primary,
      elevation: 5,
      unselectedItemColor: ColorManager.grey,
      backgroundColor: ColorManager.black,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ColorManager.white),
      fillColor: MaterialStateProperty.all(ColorManager.primary),
    ),
    dividerColor: ColorManager.lightGrey,

    textTheme: TextTheme(
      //headline
      headlineLarge: TextStyle(
          fontSize: 34, color: ColorManager.white, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: 28, color: ColorManager.white, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: 24, color: ColorManager.white, fontWeight: FontWeight.w600),

      //title
      titleLarge: TextStyle(
          fontSize: 22, color: ColorManager.white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontSize: 18,
          color: ColorManager.white,
          fontWeight: FontWeight.w500), // category title etc ..
      titleSmall: TextStyle(
          fontSize: 14, color: ColorManager.white, fontWeight: FontWeight.w500),

      //body
      bodyLarge: TextStyle(
          fontSize: 16,
          color: ColorManager.white,
          fontWeight: FontWeight.w700), // product titles etc..
      bodyMedium: TextStyle(
          fontSize: 14,
          color: ColorManager.white,
          fontWeight: FontWeight.w500), // discount number etc...
      bodySmall: TextStyle(
          fontSize: 11,
          color: ColorManager.white,
          fontWeight: FontWeight.normal), //for buttons

      //label
      labelLarge: TextStyle(
          fontSize: 14,
          color: ColorManager.grey,
          fontWeight: FontWeight.normal),
      labelMedium: TextStyle(
          fontSize: 12, color: ColorManager.grey, fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
          fontSize: 11,
          color: ColorManager.grey,
          fontWeight: FontWeight.w400), //section label
    ),
  );
}

fontFamilySelector() {
  final _storage = Get.find<StorageService>();
  final _config = Get.find<Configs>();
  debugPrint(_storage.read(_config.language.toString()));
  return _storage.read(_config.language) == _config.english
      ? fontNameEng
      : _storage.read(_config.language) == _config.arabic
          ? fontNameArb
          : _storage.read(_config.language) == _config.kurdish
              ? fontNameKrd
              : fontNameEng;
}

const String fontNameEng = 'nunito';
// const String fontNameEng = 'poppins';
const String fontNameKrd = 'nunito';
const String fontNameArb = 'nunito';
