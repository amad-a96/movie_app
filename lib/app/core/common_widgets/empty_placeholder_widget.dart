import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constant/color_manager.dart';

// ignore: unused_import

class EmptyScreenPlaceholderWidget extends StatelessWidget {
  final String message;
  final String lottie;
  final bool? repeat;
  final Widget? widget;
  const EmptyScreenPlaceholderWidget(
      {Key? key,
      required this.message,
      required this.lottie,
      this.repeat,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            reverse: true,
            height: 265,

            // width: 250,
            lottie,
            repeat: repeat,
          ),
          widget ??
              AutoSizeText(message,
                  maxFontSize: 24,
                  minFontSize: 6,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: ColorManager.primary,
                  )),

          //Primary
        ],
      ),
    );
  }
}
