import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF373B3F), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText("Limit Price"),
            SizedBox(width: 10),
            Icon(
              Icons.info_outline_rounded,
              color: textGrayColor,
              size: 17,
            )
          ],
        ),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "0.00",
              hintStyle: const TextStyle(color: textGrayColor),
              suffixIcon: Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: const CustomText("USD", weight: FontWeight.w600)),
            ),
          ),
        )
      ]),
    );
  }
}
