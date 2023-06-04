import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/custom_text.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedWidget;
  List<Map<String, dynamic>> widgetList = [
    {
      "icon": 'assets/icon/btc.svg',
      "title": "BTCUSDT",
      "id": "BTC",
    },
    {
      "icon": 'assets/icon/btc.svg',
      "title": "ETHUSDT",
      "id": "ETH",
    },
    {
      "icon": 'assets/icon/btc.svg',
      "title": "BNBUSDT",
      "id": "BNB",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedWidget,
        dropdownColor: cardColor,
        hint: const Row(
          children: [
            SvgViewer(
              "assets/icon/btc.svg",
              height: 30,
            ),
            SizedBox(width: 10),
            CustomText(
              'BTCUSDT',
              size: 20,
              color: Colors.white,
              weight: FontWeight.w400,
            ),
            SizedBox(width: 10),
          ],
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        onChanged: (newValue) {
          setState(() {
            selectedWidget = newValue;
          });
        },
        items: widgetList.map((Map widget) {
          return DropdownMenuItem<String>(
            value: widget['id'].toString(),
            child: Row(children: [
              SvgViewer(
                widget['icon'],
                height: 30,
              ),
              const SizedBox(width: 10),
              CustomText(
                widget['title'],
                size: 20,
                color: Colors.white,
                weight: FontWeight.w400,
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
