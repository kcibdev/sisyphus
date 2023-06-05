import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool check) onChanged;
  const CustomCheckbox(
      {super.key,
      required this.title,
      this.value = false,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: const Color(0xFF373B3F), // set the color here
      ),
      child: CheckboxListTile(
        enableFeedback: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Row(
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
        value: value,
        onChanged: (check) => onChanged(check!),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
