import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';

enum HourChangeType { CHANGE, HIGH, LOW, VOLUME }

class HourChange extends StatefulWidget {
  final HourChangeType type;
  final String title;
  const HourChange(
    this.title, {
    super.key,
    required this.type,
  });

  @override
  State<HourChange> createState() => _HourChangeState();
}

class _HourChangeState extends State<HourChange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: cardColor))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            if (widget.type == HourChangeType.CHANGE)
              const Icon(
                Icons.access_time,
                color: textGrayColor,
                size: 18,
              ),
            if (widget.type != HourChangeType.CHANGE)
              SvgViewer(
                switch (widget.type) {
                  HourChangeType.CHANGE => "",
                  HourChangeType.HIGH => "assets/icon/arrow_up.svg",
                  HourChangeType.LOW => "assets/icon/arrow_down.svg",
                  HourChangeType.VOLUME => "assets/icon/volume.svg",
                },
                width: 17,
                height: 17,
                color: textGrayColor,
              ),
            const SizedBox(width: 5),
            CustomText("24h ${widget.title}"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CustomText(
              "520.80",
              size: 20,
              color: widget.type == HourChangeType.CHANGE
                  ? greenTextColor
                  : Colors.white,
            ),
            const SizedBox(width: 7),
            CustomText(
              "+1.25%",
              size: 20,
              color: widget.type == HourChangeType.CHANGE
                  ? greenTextColor
                  : Colors.white,
            ),
          ],
        )
      ]),
    );
  }
}
