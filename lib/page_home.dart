import 'package:bud/page_about.dart';
import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';
import 'package:bud/page_result.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late int buttonNavIndex;
  TextEditingController drugName = TextEditingController();

  search() {
    Sofy.getDrugList(drugName.text).then((value) {
      var xDrugList = value['data'];
      if (xDrugList == null) {
        //print("kosong woi");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Drug not Found'),
              content: Text(
                  'The drug you searched (${drugName.text}) for was not found.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageResult(drugName.text)));
      }
    });
  }

  @override
  void initState() {
    // buttonNavIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.compost),
            SizedBox(
              width: 5,
            ),
            Text(Sofy.namaAplikasi),
          ],
        ),
      ),
      body: Container(
        //color: Colors.black26,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/drugs.png'),
                  width: 150,
                ),
                SizedBox(height: 20),
                Text('Drug Beyond Use Date Information'),
                SizedBox(height: 20),
                TextField(
                  controller: drugName,
                  decoration: InputDecoration(
                    labelText: 'Search Drug',
                    hintText: 'Input drug name here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    search();
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.amber,
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
              context,
              MaterialPageRoute(
                builder: (context) => PageAbout(),
              ),
            );
          }
        },
      ),
    );
  }
}
