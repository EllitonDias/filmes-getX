import 'package:flutter/material.dart';

sealed class MoviesTheme {
  static String get title => 'Filmes';
  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.black, 
    fontFamily: 'Metropolis',
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      shadowColor: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 4.0,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.white70,
      unselectedIconTheme: IconThemeData(
        color: Colors.white70,
      ),
    ),
  );
}
