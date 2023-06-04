import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class OrderTrade extends StatelessWidget {
  final bool topInfo;
  final double price;
  final double amount;
  final double bgPercent;

  const OrderTrade(
      {super.key,
      this.topInfo = true,
      required this.price,
      required this.amount,
      this.bgPercent = 0.995});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [
            bgPercent, // percentage value 0.5 = 50%
            0.01,
          ],
          colors: [
            Colors.transparent, //container base color
            topInfo
                ? const Color.fromARGB(255, 126, 36, 8)
                : const Color.fromARGB(
                    255, 4, 118, 6), // the color you need to fill,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                "$price",
                weight: FontWeight.w500,
                color: topInfo ? const Color(0xFFFF6838) : successColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                "$amount",
                weight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                (price + amount).toStringAsFixed(2),
                weight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
