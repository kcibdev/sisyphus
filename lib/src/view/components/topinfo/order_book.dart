import 'package:flutter/material.dart';
import 'package:roqqu/src/view/components/custom_text.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({super.key});

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: CustomText("Order book"));
  }
}
