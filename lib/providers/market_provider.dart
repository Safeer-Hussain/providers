import 'package:flutter/material.dart';
import 'package:providers/models/api.dart';
import 'package:providers/models/crypto_currency.dart';

class MarketProvider with ChangeNotifier {
  MarketProvider() {
    getMarkets();
  }

  List<CryptoCurrency> markets = [];
  void getMarkets() async {
    List<dynamic> listOfMaps = await Api.fetchData();
    List<CryptoCurrency> temp = [];
    for (var i in listOfMaps) {
      temp.add(CryptoCurrency.fromJson(i));
    }
    markets = temp;
    notifyListeners();
  }
}
