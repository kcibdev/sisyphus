import 'package:flutter/material.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class RecentTrades extends StatefulWidget {
  const RecentTrades({super.key});

  @override
  State<RecentTrades> createState() => _RecentTradesState();
}

class _RecentTradesState extends State<RecentTrades> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        alignment: Alignment.center,
        child: const CustomText(
          "Recent trade",
          size: 18,
        ));
  }
}
