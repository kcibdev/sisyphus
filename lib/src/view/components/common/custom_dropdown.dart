import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
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

class CustomListDropdown extends StatelessWidget {
  final List items;
  final String selectedItem;
  final Function(String selected) onSelect;
  final bool isButtonColor;
  final Color? color;
  final double size;
  const CustomListDropdown(
      {super.key,
      required this.items,
      this.isButtonColor = true,
      required this.selectedItem,
      required this.onSelect,
      this.color,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isButtonColor ? cardColor : null,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedItem,
          dropdownColor: cardColor,
          hint: CustomText(
            selectedItem.toString(),
            size: size,
            color: color ?? Colors.white,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: color ?? Colors.white,
          ),
          onChanged: (newValue) => onSelect(newValue!),
          items: items.map((dynamic widget) {
            return DropdownMenuItem<String>(
              value: widget.toString(),
              child: CustomText(
                widget.toString(),
                size: size,
                color: color ?? Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
