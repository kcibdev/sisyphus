import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? tap;
  final String text;
  final Color? backgroundColor;
  final double height;
  final double width;
  final double radius;

  const CustomButton(this.text,
      {Key? key,
      this.tap,
      this.height = 47,
      this.width = double.infinity,
      this.radius = 5,
      this.backgroundColor})
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
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
