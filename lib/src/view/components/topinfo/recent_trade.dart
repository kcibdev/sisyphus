import 'package:flutter/material.dart';
import 'package:roqqu/src/view/components/custom_text.dart';

class RecentTrades extends StatefulWidget {
  const RecentTrades({super.key});

  @override
  State<RecentTrades> createState() => _RecentTradesState();
}

class _RecentTradesState extends State<RecentTrades> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: CustomText("Recent trade"));
  }
}
