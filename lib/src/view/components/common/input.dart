import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_dropdown.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const InputField({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    FocusNode node = FocusNode();
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF373B3F), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        GestureDetector(
          onTap: () => node.requestFocus(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(title),
              const SizedBox(width: 10),
              const Icon(
                Icons.info_outline_rounded,
                color: textGrayColor,
                size: 17,
              )
            ],
          ),
        ),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.right,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            focusNode: node,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: textGrayColor, fontFamily: "Satoshi"),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: InputBorder.none,
              hintText: "0.00",
              hintStyle:
                  const TextStyle(color: textGrayColor, fontFamily: "Satoshi"),
              suffixIcon: Container(
                alignment: Alignment.center,
                width: 50,
                child: const CustomText("USD", weight: FontWeight.w600),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class InputDropdownField extends StatelessWidget {
  const InputDropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF373B3F), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText("Type"),
                SizedBox(width: 10),
                Icon(
                  Icons.info_outline_rounded,
                  color: textGrayColor,
                  size: 17,
                )
              ],
            ),
            CustomListDropdown(
              items: const ["Good till cancelled"],
              selectedItem: "Good till cancelled",
              size: 15,
              isButtonColor: false,
              color: textGrayColor,
              onSelect: (value) => {},
            )
          ]),
    );
  }
}
