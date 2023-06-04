import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:roqqu/src/lib/theme.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CandlestickChart extends StatefulWidget {
  const CandlestickChart({super.key});

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  final channel = WebSocketChannel.connect(
    // Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@kline_1m'),
    // Uri.parse('wss://testnet.binance.vision/ws-api/v3'),
    Uri.parse('wss://ws-api.binance.com:9443/ws-api/v3'),
  );

  List<Candle> data = [];

  String symbol = 'btcusdt'; // Replace with your desired symbol
  String interval = '1m'; // Replace with your desired interval

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
        '{"method":"klines","params":{"symbol": "BTCUSDT","interval": "12h","startTime": 1655969280000, "limit": 40},"id":"1dbbeb56-8eea-466a-8f6e-86bdcfa2fc0b"}');
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
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Column(children: [
        // Time change
        SizedBox(
          height: 500,
          child: Candlesticks(
            candles: data,
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
