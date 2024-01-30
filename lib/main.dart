import "package:bud/page_home.dart";
import "package:flutter/material.dart";

void main() {
  runApp(FatihApp());
}

class FatihApp extends StatelessWidget {
  const FatihApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.amber,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        centerTitle: false,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber),
      ),
      // textTheme: TextTheme(
      //   labelLarge: TextStyle(
      //     color: Colors.black,
      //   ),
      // ),
    );
    return MaterialApp(
      home: PageHome(),
      theme: themeData,
    );
  }
}
