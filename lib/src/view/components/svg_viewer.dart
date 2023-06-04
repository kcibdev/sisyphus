import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgViewer extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  const SvgViewer(this.assetName, {super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, width: width, height: height);
  }
}
