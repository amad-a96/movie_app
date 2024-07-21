import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/app/core/common_widgets/custom_background.dart';

import '../../../../core/constant/color_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomBackground(
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            // Image.asset(
            //   LogoAssets.atroWhiteLogo,
            //   height: 200,
            // ),
            Center(
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Movie App',

                    // speed: Duration(milliseconds: 100),
                    textStyle: Get.textTheme.headlineLarge!
                        .copyWith(color: ColorManager.white),
                    colors: [
                      ColorManager.white,
                      ColorManager.white,
                      ColorManager.primary,
                      ColorManager.primary,
                      ColorManager.primary,
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Spacer(),
            LoadingAnimationWidget.waveDots(
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    ));
  }
}
