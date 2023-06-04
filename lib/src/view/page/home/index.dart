import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/utils/number_format.dart';
import 'package:roqqu/src/view/components/bottom_info/tab.dart';
import 'package:roqqu/src/view/components/common/bottom_sheet.dart';
import 'package:roqqu/src/view/components/common/custom_buttons.dart';
import 'package:roqqu/src/view/components/common/custom_dropdown.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/hour_change.dart';
import 'package:roqqu/src/view/components/image_viewer.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';
import 'package:roqqu/src/view/components/topinfo/tab.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          shadowColor: Colors.grey[400],
          backgroundColor: const Color(0xFF1C2127),
          title: const SvgViewer("assets/image/logo.svg"),
          actions: const [
            ImageViewer("assets/image/avatar.png",
                width: 30, height: 30, radius: 50),
            SizedBox(width: 15),
            SvgViewer("assets/icon/world.svg", width: 30, height: 30),
            SizedBox(width: 15),
            SvgViewer("assets/icon/menu.svg", width: 25, height: 23),
            SizedBox(width: 15),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: bgColor,
                child: Column(children: [
                  // BTC dropdown & Price
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CustomDropdown(),
                        const SizedBox(width: 20),
                        CustomText(
                          formatCurrency(20634, decimal: 0),
                          color: greenTextColor,
                          size: 23,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  // 24h Change
                  SizedBox(
                    height: 82,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children: const [
                        HourChange("Change", type: HourChangeType.CHANGE),
                        HourChange("High", type: HourChangeType.HIGH),
                        HourChange("Low", type: HourChangeType.LOW),
                        HourChange("Volume", type: HourChangeType.VOLUME),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Top Info
                  const TopInfo(),
                  const BottomTab()
                ]),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: cardColor,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    "Buy",
                    backgroundColor: successColor,
                    height: 40,
                    tap: () => addAction(context, const BuySell()),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    "Sell",
                    backgroundColor: alertColor,
                    height: 40,
                    tap: () => addAction(context, const BuySell()),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
