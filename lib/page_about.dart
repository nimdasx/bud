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
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
                'The development of technology today plays an important role in fulfilling the needs of extracting information and knowledge. Currently, information about drugs is often accessed through smartphones.'),
            SizedBox(height: 10),
            Text(
                'Pharmacists, as providers of drug information, will be greatly assisted by easy access to drug information searches. Many applications about drug information are currently available.'),
            SizedBox(height: 10),
            Text(
                'The rapid development of digital technology should facilitate access to the search for BUD information needed by pharmacists. However, until now, both from references and the Google Play search engine, there are no mobile applications available providing detailed information about BUD.'),
            SizedBox(height: 10),
            Text(
                'Therefore, we hope that the "${Sofy.namaAplikasi}" application will be a solution for pharmacists to find information about BUD drugs. ${Sofy.namaAplikasi} is an application developed through research involving hospital pharmacists in Yogyakarta. The information needs required by pharmacists about BUD information are outlined in "${Sofy.namaAplikasi}".'),
            SizedBox(height: 10),
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
