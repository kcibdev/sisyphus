import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:roqqu/src/view/components/common/custom_text.dart';
import 'package:roqqu/src/view/components/svg_viewer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CandlestickChart extends StatefulWidget {
  const CandlestickChart({super.key});

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart>
    with AutomaticKeepAliveClientMixin<CandlestickChart> {
  //The data gotten from this uri has almost the same value for the high, low, close etc make it look like a block on the candlestick chart
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@kline_1m'),
    // Uri.parse('wss://testnet.binance.vision/ws-api/v3'),
    // Uri.parse('wss://ws-api.binance.com:9443/ws-api/v3'),
  );

  List<Candle> data = [];
  String selectedTime = "4H";

  @override
  void initState() {
    super.initState();
    getCandlestickDataStream();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void getCandlestickDataStream() async {
    channel.stream.listen((event) {
      Candle incomingData = parseCandlestickData(event);
      if (data.length < 13) {
        //Adding dummy data firstly cause the candlestick package require atleast 13 items
        List<Candle> candle = List.generate(
            13,
            (index) => Candle(
                close: 25694.23000000,
                high: 25694.23000000,
                low: 25688.66000000,
                volume: 19.45139000,
                date: DateTime.fromMillisecondsSinceEpoch(1686051000000),
                open: 25691.37000000));

        candle.add(incomingData);

        setState(() {
          data.addAll(candle);
        });
      } else {
        setState(() {
          data.insert(0, incomingData);
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
      // Time change

      SizedBox(
        height: 50,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText("Time"),
                  const SizedBox(width: 10),
                  Row(
                    children: ["1H", "2H", "4H", "1D", "1W", "1M"]
                        .map((e) => GestureDetector(
                              onTap: () => setState(() => selectedTime = e),
                              child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: selectedTime == e
                                        ? secondaryColor
                                        : Colors.transparent,
                                  ),
                                  child: CustomText(e)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: Color(0xFF394047),
                        ),
                      ),
                    ),
                    child: const SvgViewer(
                      "assets/icon/chart.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CustomText("Fx Indicators"),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: Color(0xFF394047),
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SvgViewer(
                          "assets/icon/undo.svg",
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(width: 10),
                        SvgViewer(
                          "assets/icon/redo.svg",
                          width: 22,
                          height: 22,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
      ),
      const SizedBox(height: 10),
      Container(
          width: double.infinity, height: 1, color: const Color(0xFF394047)),
      SizedBox(
        height: 500,
        child: Candlesticks(
          candles: data,
          actions: [
            ToolBarAction(
              width: 110,
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: secondaryColor,
                ),
                child: const CustomText("Trading view"),
              ),
            ),
            ToolBarAction(
                width: 60, onPressed: () {}, child: const CustomText("Depth")),
            ToolBarAction(
                child: const SvgViewer("assets/icon/expand.svg"),
                onPressed: () {})
          ],
        ),
      )
    ]);
  }

  Candle parseCandlestickData(String data) {
    Map<String, dynamic> json = jsonDecode(data);
    int timestamp = json['k']['t'];
    double open = double.parse(json['k']['o']);
    double high = double.parse(json['k']['h']);
    double low = double.parse(json['k']['l']);
    double close = double.parse(json['k']['c']);
    double volume = double.parse(json['k']['v']);

    Candle candle = Candle(
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
      date: DateTime.fromMillisecondsSinceEpoch(timestamp),
    );

    return candle;
  }
}
