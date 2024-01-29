import 'package:bud/page_result_detail.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  //const ResultPage({super.key});
  final String kataKunci;
  ResultPage(this.kataKunci);

  @override
  Widget build(BuildContext context) {
    String drugId;
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
            Text('Search : $kataKunci'),
            SizedBox(
              height: 20,
            ),
            for (int i = 1; i <= 3; i++)
              TextButton(
                onPressed: () {
                  drugId = '$i';
                  print('drugId $i ditekan!');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultDetailPage(drugId)));
                },
                child: Text('Tombol $i'),
              ),
          ]),
        ]),
      ),
    );
  }
}
