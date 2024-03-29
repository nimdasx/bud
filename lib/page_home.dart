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
  String xVersion = '';

  pacul() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageResult(kataKunci: ''),
      ),
    );
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageResult(kataKunci: drugName.text),
          ),
        );
      }
    });
  }

  Future load() async {
    var zVersion = await Sofy.getPackageInfoVersion();
    setState(() {
      xVersion = zVersion;
    });
  }

  @override
  void initState() {
    // buttonNavIndex = 0;
    super.initState();
    load();
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
                  image: AssetImage('assets/biyud_trans.png'),
                  width: 150,
                ),
                SizedBox(height: 20),
                Text(
                  '${Sofy.namaAplikasi} v$xVersion',
                  style: TextStyle(fontSize: 10),
                ),
                Text('Drug Beyond Use Date Information'),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: drugName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                      hintText: "Input drug name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        search();
                      },
                      child: Text('Search'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        pacul();
                      },
                      child: Text('Drug List'),
                    ),
                  ],
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
