import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

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
                "No Order History",
                size: 25,
                color: Colors.white,
                weight: FontWeight.w500,
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
