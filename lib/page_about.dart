import 'package:flutter/material.dart';

class PageAbout extends StatelessWidget {
  const PageAbout({super.key});

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
          SizedBox(
            height: 20,
          ),
          Text(
              'Drug BUD App is a cutting-edge mobile application tailored specifically for hospital pharmacists, empowering them to efficiently monitor and manage medications mixed with solvents. Developed by pharmaceutical experts, this application is designed to streamline medication processes within the hospital environment'),
          SizedBox(height: 20),
          Text('If you have any questions, please email me at shofia@gmail.com')
        ]),
      ),
    );
  }
}
