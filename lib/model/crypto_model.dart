class CryptoModel {
  final String name;
  final String symbol;
  final double price;
  final double marketCap;
  final List<double> priceChangeHistory;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.marketCap,
    required this.priceChangeHistory,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      name: json['name'],
      symbol: json['symbol'],
      price: json['current_price'],
      marketCap: json['market_cap'],
      priceChangeHistory: List<double>.from(json['sparkline_in_7d']['price']),
    );
  }
}
