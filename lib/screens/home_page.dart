import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/market_provider.dart';
import 'package:providers/providers/theme_provider.dart';

import '../widgets/currency_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            marketProvider.getMarkets();
          },
          child: const Icon(Icons.refresh),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text("Welcome Back"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text(
              "Crypto Today",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return IconButton(
                  onPressed: () {
                    themeProvider.changeTheme();
                  },
                  icon: themeProvider.currentTheme == ThemeData.dark()
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                );
              },
            )
          ]),
          const Expanded(child: CurrencyDetails()),
        ]),
      ),
    );
  }
}
