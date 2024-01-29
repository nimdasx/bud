import 'package:flutter/material.dart';

class ResultDetailPage extends StatelessWidget {
  //const ResultDetailPage({super.key});
  final int drugId;
  ResultDetailPage(this.drugId);

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
        child: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Drug ID : $drugId'),
            Text('Drug Name'),
            Text('Beyond Use Date :')
          ]),
        ]),
      ),
    );
  }
}
