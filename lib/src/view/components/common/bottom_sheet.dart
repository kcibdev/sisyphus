import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_buttons.dart';
import 'package:roqqu/src/view/components/common/custom_checkbox.dart';
import 'package:roqqu/src/view/components/common/custom_dropdown.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/common/input.dart';

class BuySell extends StatefulWidget {
  const BuySell({super.key});

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  bool _checked = false;
  final double _total = 0.00;
  String selectedCurrency = "NGN";
  List<String> fiatCurrencies = [
    'NGN',
    'USD',
    'EUR',
    'JPY',
    'GBP',
    'CHF',
    'CAD',
    'AUD',
    'NZD',
    'HK)'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.16),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      "Buy",
                      backgroundColor: grayBg,
                      border: Border.all(color: greenTextColor, width: 2),
                      radius: 10,
                    ),
                  ),
                  const Expanded(
                    child: CustomButton("Sell",
                        backgroundColor: Colors.transparent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(3),
              height: 45,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    "Limit",
                    backgroundColor: Color(0xFF353945),
                    width: 100,
                    radius: 20,
                  ),
                  CustomButton(
                    "Market",
                    backgroundColor: Colors.transparent,
                    textColor: textGrayColor,
                    width: 100,
                  ),
                  CustomButton(
                    "Stop-Limit",
                    backgroundColor: Colors.transparent,
                    textColor: textGrayColor,
                    width: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const InputField(title: "Limit Price"),
            const SizedBox(height: 15),
            const InputField(title: "Amount"),
            const SizedBox(height: 15),
            const InputDropdownField(),
            const SizedBox(height: 15),
            CustomCheckbox(
                title: "Post",
                value: _checked,
                onChanged: (check) => setState(() => _checked = check)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const CustomText("Total"), CustomText("$_total")],
            ),
            const SizedBox(height: 15),
            const CustomButton("Buy BTC",
                radius: 10,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.4792, 0.9635],
                  colors: [
                    Color(0xFF483BEB),
                    Color(0xFF7847E1),
                    Color(0xFFDD568D),
                  ],
                )),
            const SizedBox(height: 15),
            Container(
                width: double.infinity,
                height: 1,
                color: const Color(0xFF394047)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Total account value",
                      size: 14,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      "0.00",
                      color: Colors.white,
                    ),
                  ],
                ),
                CustomListDropdown(
                  selectedItem: selectedCurrency,
                  items: fiatCurrencies,
                  isButtonColor: false,
                  color: textGrayColor,
                  onSelect: (value) => setState(() => selectedCurrency = value),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Open Orders",
                      size: 14,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      "0.00",
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Available",
                      size: 14,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      "0.00",
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: CustomButton(
                "Deposit",
                width: 90,
                backgroundColor: const Color(0xFF2764FF),
                radius: 10,
                tap: () {},
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

addAction(BuildContext context, Widget child) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              padding: const EdgeInsets.only(top: 20),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.15),
              child: child);
        });
      });
}
