import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/model/orderbook.model.dart';
import 'package:roqqu/src/view/components/common/custom_dropdown.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/order_trade.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({super.key});

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook>
    with AutomaticKeepAliveClientMixin<OrderBook> {
  int selectedMenu = 0;
  String selectedNumber = "10";
  List<int> intList = List.generate(100, (index) => index + 1);
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://ws-api.binance.com:9443/ws-api/v3'),
  );
  OrderBookModel? orderBookModel;

  void selectMenu(int index) {
    setState(() {
      selectedMenu = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchOrderBook();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void fetchOrderBook() async {
    channel.sink.add(
        '{"method":"depth","params":{"symbol": "BTCUSDT","limit": 5},"id":"51e2affb-0aba-4821-ba75-f2625006eb43"}');
    channel.stream.listen((event) async {
      final newData = jsonDecode(event);
      if (newData['result'] != null) {
        setState(() {
          orderBookModel = OrderBookModel.fromJson(newData);
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
      if (orderBookModel?.result != null)
        ListView.builder(
            itemCount: orderBookModel?.result?.bids.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final bidPrice = orderBookModel?.result?.bids[index][0];
              final bidAmount = orderBookModel?.result?.bids[index][1];
              final price = bidPrice != null ? double.parse(bidPrice) : 0.0;
              final amount = bidAmount != null ? double.parse(bidAmount) : 0.0;
              return OrderTrade(
                price: price,
                amount: amount,
                bgPercent: amount *
                    4, //I absolutely have just did some random things here in order to fasten up, Sorry ;)
              );
            })
      else
        Container(
            alignment: Alignment.center,
            height: 200,
            child: const CircularProgressIndicator(
              color: Color.fromARGB(255, 126, 36, 8),
            )),
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
      if (orderBookModel?.result != null)
        ListView.builder(
            itemCount: orderBookModel?.result?.bids.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final asksPrice = orderBookModel?.result?.asks[index][0];
              final asksAmount = orderBookModel?.result?.asks[index][1];
              final price = asksPrice != null ? double.parse(asksPrice) : 0.0;
              final amount =
                  asksAmount != null ? double.parse(asksAmount) : 0.0;
              return OrderTrade(
                price: price,
                amount: amount,
                bgPercent: amount *
                    4, //I absolutely have just did some random things here in order to fasten up, Sorry ;)
                topInfo: false,
              );
            })
      else
        Container(
            alignment: Alignment.center,
            height: 200,
            child: const CircularProgressIndicator(
              color: Color.fromARGB(255, 4, 118, 6),
            )),
    ]);
  }
}
