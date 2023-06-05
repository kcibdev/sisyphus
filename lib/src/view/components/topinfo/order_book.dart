import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_dropdown.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/order_trade.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({super.key});

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  int selectedMenu = 0;
  String selectedNumber = "10";
  List<int> intList = List.generate(100, (index) => index + 1);

  void selectMenu(int index) {
    setState(() {
      selectedMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => selectMenu(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMenu == 0 ? cardColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    child: const SvgViewer("assets/icon/order_left_menu.svg",
                        width: 20, height: 20),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => selectMenu(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMenu == 1 ? cardColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    child: const SvgViewer("assets/icon/order_center_menu.svg",
                        width: 20, height: 20),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => selectMenu(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMenu == 2 ? cardColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    child: const SvgViewer("assets/icon/order_right_menu.svg",
                        width: 20, height: 20),
                  ),
                ),
              ],
            ),
            CustomListDropdown(
              selectedItem: selectedNumber,
              items: intList,
              onSelect: (value) => setState(() => selectedNumber = value),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  "Price",
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 3),
                CustomText(
                  "(USDT)",
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  "Amount",
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 3),
                CustomText(
                  "(BTC)",
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  "Total",
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 3),
                CustomText(
                  "",
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
      const OrderTrade(price: 36920.12, amount: 0.758965, bgPercent: 0.7),
      const OrderTrade(price: 36920.12, amount: 0.758965),
      const OrderTrade(price: 36920.12, amount: 0.758965, bgPercent: 0.65),
      const OrderTrade(price: 36920.12, amount: 0.758965),
      const OrderTrade(price: 36920.12, amount: 0.758965, bgPercent: 0.3),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              "36,641.20",
              color: greenTextColor,
              size: 22,
            ),
            SizedBox(width: 10),
            SvgViewer(
              "assets/icon/arrow_up.svg",
              color: greenTextColor,
              width: 20,
              height: 20,
            ),
            SizedBox(width: 10),
            CustomText(
              "36,641.20",
              color: Colors.white,
              size: 22,
            ),
          ],
        ),
      ),
      const OrderTrade(
          price: 36920.12, amount: 0.758965, bgPercent: 0.4, topInfo: false),
      const OrderTrade(
          price: 36920.12, amount: 0.758965, bgPercent: 0.55, topInfo: false),
      const OrderTrade(
          price: 36920.12, amount: 0.758965, bgPercent: 0.685, topInfo: false),
      const OrderTrade(price: 36920.12, amount: 0.758965, topInfo: false),
      const OrderTrade(
          price: 36920.12, amount: 0.758965, bgPercent: 0.55, topInfo: false),
    ]);
  }
}
