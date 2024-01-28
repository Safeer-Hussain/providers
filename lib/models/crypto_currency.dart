class CryptoCurrency {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double marketCap;
  double marketCapRank;
  double high24H;
  double low24H;
  double ath;
  double priceChange24H;
  double priceChangePercentage24H;
  double circulatingSupply;
  double atl;

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.circulatingSupply,
    required this.priceChangePercentage24H,
    required this.ath,
    required this.atl,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => CryptoCurrency(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        marketCap: json["market_cap"].toDouble(),
        marketCapRank: json["market_cap_rank"].toDouble(),
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        ath: json["ath"].toDouble(),
        atl: json["atl"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
      );
}
