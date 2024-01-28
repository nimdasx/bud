import 'package:bud/page_about.dart';
import 'package:flutter/material.dart';
import './page_result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int buttonNavIndex;
  TextEditingController _drugName = TextEditingController();

  @override
  void initState() {
    buttonNavIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Icon(Icons.compost),
            SizedBox(
              width: 5,
            ),
            Text("Drug BUD"),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: _drugName,
            decoration: InputDecoration(
              labelText: 'Search Drug',
              hintText: 'Input drug name here...',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String telo = _drugName.text;
              print('Tombol Submit ditekan! isinya $telo');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage()));
            },
            child: Text('Search'),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        currentIndex: buttonNavIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "About")
        ],
        onTap: (value) {
          setState(() {
            buttonNavIndex = value;
          });
          if (value == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutPage()));
          }
        },
      ),
    );
  }
}
