import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_buttons.dart';
import 'package:roqqu/src/view/components/common/input.dart';

class BuySell extends StatefulWidget {
  const BuySell({super.key});

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
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
                child:
                    CustomButton("Sell", backgroundColor: Colors.transparent),
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
        const InputField(),
        const SizedBox(height: 15),
        const InputField(),
        const SizedBox(height: 15),
        const InputField(),
        const SizedBox(height: 15),
        const CustomButton(
          "Buy BTC",
          radius: 10,
          backgroundColor: greenTextColor,
        ),
      ],
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
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.3),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                  ),
                  Expanded(child: child),
                ],
              ));
        });
      });
}
