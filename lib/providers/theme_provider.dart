import 'package:flutter/material.dart';
import 'package:providers/models/local_storage.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();
  ThemeData darkTheme = ThemeData.dark();
  ThemeData lightTheme = ThemeData.light();

  ThemeProvider() {
    setTheme();
  }

  void setTheme() async {
    String? theme = await LocalStorage.getTheme();
    if (theme != null) {
      currentTheme = theme == "light"
          ? currentTheme = lightTheme
          : currentTheme = darkTheme;
      notifyListeners();
    }
  }

  void changeTheme() {
    if (currentTheme.brightness.name == "light") {
      currentTheme = darkTheme;
      LocalStorage.setTheme("dark");
    } else {
      currentTheme = lightTheme;
      LocalStorage.setTheme("light");
    }

    notifyListeners();
  }
}
