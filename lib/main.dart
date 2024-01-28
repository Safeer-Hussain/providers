import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/local_storage.dart';
import 'package:providers/providers/market_provider.dart';
import 'package:providers/screens/home_page.dart';

import 'providers/theme_provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
  String? theme = await LocalStorage.getTheme() ?? "light";
  print(theme);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          home: const HomePage(),
          theme: themeProvider.currentTheme,
        );
      },
    );
  }
}
