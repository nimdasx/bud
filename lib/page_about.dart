import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({super.key});

  @override
  State<PageAbout> createState() => _PageAboutState();
}

class _PageAboutState extends State<PageAbout> {
  String xVersion = '';

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
            Text('About app'),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.compost),
                SizedBox(width: 5),
                Text(Sofy.namaAplikasi),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                '${Sofy.namaAplikasi} is a cutting-edge mobile application tailored specifically for hospital pharmacists, empowering them to efficiently monitor and manage medications mixed with solvents.'),
            SizedBox(height: 20),
            Text(
                'Developed by pharmaceutical experts, this application is designed to streamline medication processes within the hospital environment'),
            SizedBox(height: 20),
            Text(
                'If you have any questions, please email me at shofia@gmail.com'),
            SizedBox(height: 20),
            Text('App version $xVersion'),
          ],
        ),
      ),
    );
  }
}
