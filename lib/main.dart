import "package:bud/page_home.dart";
import "package:flutter/material.dart";

void main() {
  runApp(FatihApp());
}

class FatihApp extends StatelessWidget {
  const FatihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageHome());
  }
}
