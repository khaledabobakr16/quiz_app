import 'package:flutter/material.dart';

class ImageLogoOpacity extends StatelessWidget {
  const ImageLogoOpacity(this.opacityImage, {super.key});
  final double opacityImage;
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacityImage,
        child: Image.asset(
          "assets/images/quiz_logo.png",
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width,
        ));
  }
}
