import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/custom_text.dart';

class HourChange extends StatefulWidget {
  const HourChange({super.key});

  @override
  State<HourChange> createState() => _HourChangeState();
}

class _HourChangeState extends State<HourChange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: cardColor))),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: textGrayColor,
              size: 18,
            ),
            SizedBox(width: 5),
            CustomText("24h Change"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CustomText(
              "520.80",
              size: 20,
              color: Colors.white,
            ),
            SizedBox(width: 7),
            CustomText(
              "+1.25%",
              size: 20,
              color: Colors.white,
            ),
          ],
        )
      ]),
    );
  }
}
