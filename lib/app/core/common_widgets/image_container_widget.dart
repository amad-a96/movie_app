import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    this.height,
    this.width,
    required this.imgUrl,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String imgUrl;
  final BoxFit? fit;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: OctoImage(
        image: CachedNetworkImageProvider(imgUrl),
        errorBuilder: (context, error, stackTrace) {
          return Text('error loading');
        },
        fit: fit,
        height: height,
        width: width,
        alignment: alignment,
        fadeInCurve: Curves.easeIn,
        fadeOutCurve: Curves.easeOut,
        placeholderBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
