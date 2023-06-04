import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu/src/lib/theme.dart';

class SvgViewer extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  const SvgViewer(this.assetName,
      {super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color ?? textGrayColor, BlendMode.srcIn),
    );
  }
}
