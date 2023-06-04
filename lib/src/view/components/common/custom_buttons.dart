import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? tap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;
  final double radius;
  final BoxBorder? border;

  const CustomButton(this.text,
      {Key? key,
      this.tap,
      this.height = 47,
      this.width = double.infinity,
      this.radius = 5,
      this.backgroundColor,
      this.border,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context).colorScheme;
    return InkWell(
      enableFeedback: true,
      onTap: tap,
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: border,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
