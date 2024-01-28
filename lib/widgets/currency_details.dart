import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/crypto_currency.dart';
import '../providers/market_provider.dart';

class CurrencyDetails extends StatelessWidget {
  const CurrencyDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, value, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          CryptoCurrency currentCrypto = value.markets[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PKR ${currentCrypto.currentPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        double priceChange = currentCrypto.priceChange24H;
                        double priceChangePercentage =
                            currentCrypto.priceChangePercentage24H;
                        if (priceChange < 0) {
                          return Text(
                            style: const TextStyle(color: Colors.red),
                            "${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(2)})",
                          );
                        } else {
                          return Text(
                            style: TextStyle(color: Colors.blue.shade900),
                            "+${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(2)})",
                          );
                        }
                      },
                    )
                  ]),
              subtitle: Text(currentCrypto.symbol.toUpperCase()),
              leading: Image.network(currentCrypto.image),
              title: Text(
                  "${currentCrypto.name} #${currentCrypto.marketCapRank.toStringAsFixed(0)}"),
            ),
          );
        },
        itemCount: value.markets.length,
      );
    });
  }
}
