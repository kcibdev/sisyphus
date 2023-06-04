import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/bottom_info/open_order.dart';
import 'package:roqqu/src/view/components/bottom_info/order_history.dart';
import 'package:roqqu/src/view/components/bottom_info/positions.dart';
import 'package:roqqu/src/view/components/bottom_info/trade_history.dart';
import 'package:roqqu/src/view/components/common/custom_buttons.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int selectedTab = 0;

  void selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, right: 3),
          padding: const EdgeInsets.all(3),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.16),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            children: [
              CustomButton(
                "Open Orders",
                tap: () => selectTab(0),
                backgroundColor: selectedTab == 0 ? grayBg : Colors.transparent,
                width: 140,
              ),
              CustomButton(
                "Positions",
                tap: () => selectTab(1),
                backgroundColor: selectedTab == 1 ? grayBg : Colors.transparent,
                width: 140,
              ),
              CustomButton(
                "Order History",
                tap: () => selectTab(2),
                backgroundColor: selectedTab == 2 ? grayBg : Colors.transparent,
                width: 140,
              ),
              CustomButton(
                "Trade History",
                tap: () => selectTab(3),
                backgroundColor: selectedTab == 3 ? grayBg : Colors.transparent,
                width: 140,
              )
            ],
          ),
        ),
        if (selectedTab == 0) const OpenOrders(),
        if (selectedTab == 1) const Positions(),
        if (selectedTab == 2) const OrderHistory(),
        if (selectedTab == 3) const TradeHistory(),
      ]),
    );
  }
}
