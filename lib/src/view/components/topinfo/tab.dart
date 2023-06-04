import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_buttons.dart';
import 'package:roqqu/src/view/components/topinfo/chart.dart';
import 'package:roqqu/src/view/components/topinfo/order_book.dart';
import 'package:roqqu/src/view/components/topinfo/recent_trade.dart';

class TopInfo extends StatefulWidget {
  const TopInfo({super.key});

  @override
  State<TopInfo> createState() => _TopInfoState();
}

class _TopInfoState extends State<TopInfo> {
  int selectedTab = 0;

  void selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Tab bar container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xFF262932),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: grayBg)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    "Charts",
                    tap: () => selectTab(0),
                    backgroundColor:
                        selectedTab == 0 ? grayBg : const Color(0xFF262932),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    "OrderBook",
                    tap: () => selectTab(1),
                    backgroundColor:
                        selectedTab == 1 ? grayBg : const Color(0xFF262932),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    "Recent Trades",
                    tap: () => selectTab(2),
                    backgroundColor:
                        selectedTab == 2 ? grayBg : const Color(0xFF262932),
                  ),
                ),
              ],
            ),
          ),
          // Tab bar view container
          if (selectedTab == 0) const CandlestickChart(),
          if (selectedTab == 1) const OrderBook(),
          if (selectedTab == 2) const RecentTrades(),
        ],
      ),
    );
  }
}
