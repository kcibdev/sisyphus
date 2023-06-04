import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final double? radius;
  const ImageViewer(this.assetName,
      {super.key, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.asset(assetName, width: width, height: height));
  }
}
