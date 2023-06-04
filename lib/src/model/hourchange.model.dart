class HourChangeModel {
  final String symbol; // Symbol
  final String priceChange; // 24-hour price change
  final String priceChangePercent; // 24-hour percent price change
  final String lastPrice; // Last trade price
  final String lastQty; // Last trade amount
  final String open; // 24-hour open price
  final String high; // 24-hour high
  final String low; // 24-hour low
  final String volume; // Trading volume (contracts)
  final String amount; // Trade amount (in quote asset)
  final String bidPrice; // The best buy price
  final String askPrice; // The best sell price
  final int openTime; // Time the first trade occurred within the last 24 hours
  final int closeTime; // Time the last trade occurred within the last 24 hours
  final int firstTradeId; // First trade ID
  final int tradeCount; // Number of trades
  final String strikePrice; // Strike price
  final String
      exercisePrice; // Estimated settlement price one hour before exercise, returns index price at other times

  HourChangeModel({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.lastPrice,
    required this.lastQty,
    required this.open,
    required this.high,
    required this.low,
    required this.volume,
    required this.amount,
    required this.bidPrice,
    required this.askPrice,
    required this.openTime,
    required this.closeTime,
    required this.firstTradeId,
    required this.tradeCount,
    required this.strikePrice,
    required this.exercisePrice,
  });

  factory HourChangeModel.fromJson(Map<String, dynamic> json) {
    return HourChangeModel(
      symbol: json['symbol'],
      priceChange: json['priceChange'],
      priceChangePercent: json['priceChangePercent'],
      lastPrice: json['lastPrice'],
      lastQty: json['lastQty'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      volume: json['volume'],
      amount: json['amount'],
      bidPrice: json['bidPrice'],
      askPrice: json['askPrice'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      firstTradeId: json['firstTradeId'],
      tradeCount: json['tradeCount'],
      strikePrice: json['strikePrice'],
      exercisePrice: json['exercisePrice'],
    );
  }
}
