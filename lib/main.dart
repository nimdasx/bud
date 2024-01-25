import "package:flutter/material.dart";

void main() {
  runApp(FatihApp());
}

class FatihApp extends StatefulWidget {
  const FatihApp({super.key});

  @override
  State<FatihApp> createState() => _FatihAppState();
}

class _FatihAppState extends State<FatihApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drug BUD App"),
      ),
      body: Center(
        child: Text("Test"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "jangkrik")
          ]),
    );
  }
}
