import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static Future<List<dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=pkr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en&x_cg_demo_api_key=CG-eyMdB7DgQCXzQJjKUt3smiJH"),
    );
    List<dynamic> listOfMaps = jsonDecode(response.body) as List<dynamic>;
    return listOfMaps;
  }
}
