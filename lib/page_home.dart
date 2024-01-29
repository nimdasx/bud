//import 'package:bud/sofy.dart';
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
  //String apiKey = "";

  @override
  void initState() {
    // buttonNavIndex = 0;
    super.initState();
    //apiKey = await Sofy.getApiKey();
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
            Text(
              "Drug BUD App",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image(
              image: AssetImage('assets/prescription.png'),
              width: 150,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _drugName,
              decoration: InputDecoration(
                labelText: 'Search Drug',
                hintText: 'Input drug name here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String telo = _drugName.text;
                print('Tombol Submit ditekan! isinya $telo');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(telo)));
                //Sofy.getApiKey();
                //Sofy.gundul();
                //Sofy.getDrug();
              },
              child: Text('Search'),
            ),
          ]),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        // currentIndex: buttonNavIndex,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "About")
        ],
        onTap: (value) {
          // setState(() {
          //   buttonNavIndex = value;
          // });
          if (value == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutPage()));
          }
        },
      ),
    );
  }
}
