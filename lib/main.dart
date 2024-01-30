import "package:bud/page_home.dart";
import "package:flutter/material.dart";

void main() {
  runApp(FatihApp());
}

class FatihApp extends StatelessWidget {
  const FatihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageHome(),
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.amber, selectedItemColor: Colors.white),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber)),
          textTheme: TextTheme(labelLarge: TextStyle(color: Colors.black))),
    );
  }
}
