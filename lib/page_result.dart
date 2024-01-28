import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  //const ResultPage({super.key});
  final String kataKunci;
  ResultPage(this.kataKunci);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drug Search Result",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Search : $kataKunci'),
        ]),
      ),
    );
  }
}
