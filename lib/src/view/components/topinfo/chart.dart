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
  final channel = WebSocketChannel.connect(
    // Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@kline_1m'),
    // Uri.parse('wss://testnet.binance.vision/ws-api/v3'),
    Uri.parse('wss://ws-api.binance.com:9443/ws-api/v3'),
  );

  List<Candle> data = [];
  String selectedTime = "4H";

  @override
  void initState() {
    super.initState();
    fetchListenToStream();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  fetchListenToStream() async {
    channel.sink.add(
        '{"method":"klines","params":{"symbol": "BTCUSDT","interval": "12h","startTime": 1655969280000, "limit": ${data.length > 1 ? 1 : 40}},"id":"1dbbeb56-8eea-466a-8f6e-86bdcfa2fc0b"}');
    channel.stream.listen((event) async {
      // print(event);
      final newData = jsonDecode(event);

      if (newData['result'].length > 1) {
        List<Candle> streamData = (newData['result'] as List).map((klineData) {
          int timestamp = klineData[0];
          double open = double.parse(klineData[1]);
          double high = double.parse(klineData[2]);
          double low = double.parse(klineData[3]);
          double close = double.parse(klineData[4]);
          double volume = double.parse(klineData[5]);

          return Candle(
            open: open,
            high: high,
            low: low,
            close: close,
            volume: volume,
            date: DateTime.fromMillisecondsSinceEpoch(timestamp),
          );
        }).toList();

        // print(streamData.length);

        setState(() {
          data.addAll(streamData);
        });
      } else {
        Candle incomingData = parseCandlestickData(event);
        setState(() {
          data.add(incomingData);
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // color: cardColor,
      child: Column(children: [
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
                          .map((e) => Container(
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
                              child: CustomText(e)))
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
                  width: 60,
                  onPressed: () {},
                  child: const CustomText("Depth")),
              ToolBarAction(
                  child: const SvgViewer("assets/icon/expand.svg"),
                  onPressed: () {})
            ],
          ),
        )
      ]),
    );
  }

  Candle parseCandlestickData(String data) {
    Map<String, dynamic> json = jsonDecode(data);
    List<dynamic> result = json['result'];

    if (result.isNotEmpty) {
      List<dynamic> klineData = result[0];

      if (klineData.length >= 11) {
        int timestamp = klineData[0];
        double open = double.parse(klineData[1]);
        double high = double.parse(klineData[2]);
        double low = double.parse(klineData[3]);
        double close = double.parse(klineData[4]);
        double volume = double.parse(klineData[5]);

        Candle candle = Candle(
          open: open,
          high: high,
          low: low,
          close: close,
          volume: volume,
          date: DateTime.fromMillisecondsSinceEpoch(timestamp),
        );

        return candle;
      } else {
        throw const FormatException('Invalid kline data');
      }
    } else {
      throw const FormatException('Empty result array');
    }
  }
}
