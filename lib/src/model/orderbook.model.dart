class OrderBookModel {
  String id;
  int status;
  OrderBookResult? result;
  List<RateLimit>? rateLimits;

  OrderBookModel(
      {required this.id, required this.status, this.result, this.rateLimits});

  factory OrderBookModel.fromJson(Map<String, dynamic> json) {
    return OrderBookModel(
      id: json['id'],
      status: json['status'],
      result: json['result'] != null
          ? OrderBookResult.fromJson(json['result'])
          : null,
      rateLimits: json['rateLimits'] != null
          ? List<RateLimit>.from(
              json['rateLimits'].map((limit) => RateLimit.fromJson(limit)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    if (rateLimits != null) {
      data['rateLimits'] = rateLimits!.map((limit) => limit.toJson()).toList();
    }
    return data;
  }
}

class OrderBookResult {
  int lastUpdateId;
  List<List<String>> bids;
  List<List<String>> asks;

  OrderBookResult(
      {required this.lastUpdateId, required this.bids, required this.asks});

  factory OrderBookResult.fromJson(Map<String, dynamic> json) {
    return OrderBookResult(
      lastUpdateId: json['lastUpdateId'],
      bids: List<List<String>>.from(
          json['bids'].map((level) => List<String>.from(level))),
      asks: List<List<String>>.from(
          json['asks'].map((level) => List<String>.from(level))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastUpdateId'] = lastUpdateId;
    data['bids'] = bids.map((level) => List<String>.from(level)).toList();
    data['asks'] = asks.map((level) => List<String>.from(level)).toList();
    return data;
  }
}

class RateLimit {
  String rateLimitType;
  String interval;
  int intervalNum;
  int limit;
  int count;

  RateLimit(
      {required this.rateLimitType,
      required this.interval,
      required this.intervalNum,
      required this.limit,
      required this.count});

  factory RateLimit.fromJson(Map<String, dynamic> json) {
    return RateLimit(
      rateLimitType: json['rateLimitType'],
      interval: json['interval'],
      intervalNum: json['intervalNum'],
      limit: json['limit'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rateLimitType'] = rateLimitType;
    data['interval'] = interval;
    data['intervalNum'] = intervalNum;
    data['limit'] = limit;
    data['count'] = count;
    return data;
  }
}
