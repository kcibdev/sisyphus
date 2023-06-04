class CandlestickModel {
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;
  final String amount;
  final String interval;
  final int tradeCount;
  final String takerVolume;
  final String takerAmount;
  final int openTime;
  final int closeTime;

  CandlestickModel({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.amount,
    required this.interval,
    required this.tradeCount,
    required this.takerVolume,
    required this.takerAmount,
    required this.openTime,
    required this.closeTime,
  });

  factory CandlestickModel.fromJson(Map<String, dynamic> json) {
    return CandlestickModel(
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      volume: json['volume'],
      amount: json['amount'],
      interval: json['interval'],
      tradeCount: json['tradeCount'],
      takerVolume: json['takerVolume'],
      takerAmount: json['takerAmount'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
    );
  }
}
