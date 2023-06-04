import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight weight;
  final TextAlign align;
  final String font;
  final TextOverflow? overflow;
  final int? max;
  final bool? wrap;
  final double? height;
  final double? space;
  final FontStyle? style;

  const CustomText(this.text,
      {super.key,
      this.size = 15,
      this.color,
      this.weight = FontWeight.w500,
      this.align = TextAlign.left,
      this.font = "Satoshi",
      this.overflow,
      this.wrap,
      this.max,
      this.height,
      this.space,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: max,
      overflow: overflow,
      softWrap: wrap,
      style: TextStyle(
        fontStyle: style,
        fontSize: size,
        height: height,
        color: color ?? const Color(0xFFA7B1BC),
        fontWeight: weight,
        fontFamily: font,
        wordSpacing: space,
      ),
    );
  }
}
