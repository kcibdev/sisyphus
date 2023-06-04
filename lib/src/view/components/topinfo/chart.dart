import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';

class CandlestickChart extends StatefulWidget {
  const CandlestickChart({super.key});

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  List<Candle> candles = [];

  generateDummyCandles() {
    // Generate dummy data for 5 candles
    for (int i = 0; i < 7; i++) {
      DateTime date =
          DateTime.now(); // Replace with the desired date for each candle
      double high =
          100.0; // Replace with the desired high price for each candle
      double low = 50.0; // Replace with the desired low price for each candle
      double open = 80.0; // Replace with the desired open price for each candle
      double close =
          90.0; // Replace with the desired close price for each candle
      double volume = 1000.0; // Replace with the desired volume for each candle

      Candle candle = Candle(
        date: date,
        high: high,
        low: low,
        open: open,
        close: close,
        volume: volume,
      );

      candles.add(candle);
    }
  }

  @override
  void initState() {
    generateDummyCandles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // Time change
        SizedBox(
          height: 500,
          child: Candlesticks(
            candles: candles,
            actions: const [],
          ),
        )
      ]),
    );
  }
}
