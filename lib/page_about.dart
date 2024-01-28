import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  //const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About App",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.compost),
          Text('blw bwlfkjsafas k'),
        ]),
      ),
    );
  }
}
