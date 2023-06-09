import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class OpenOrders extends StatelessWidget {
  const OpenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: cardColor,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                "No Open Orders",
                size: 25,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 270),
                child: const CustomText(
                  "Velit laborum voluptate Lorem occaecat ea anim anim culpa eiusmod non consequat et qui.",
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                ),
              )
            ]),
      ),
    );
  }
}
