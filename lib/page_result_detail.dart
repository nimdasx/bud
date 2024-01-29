import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';

class ResultDetailPage extends StatefulWidget {
  //const ResultDetailPage({super.key});
  final int drugId;
  ResultDetailPage(this.drugId);

  @override
  State<ResultDetailPage> createState() => _ResultDetailPageState();
}

class _ResultDetailPageState extends State<ResultDetailPage> {
  List<dynamic> drug = [];

  Future<void> load() async {
    try {
      List<dynamic> data = await Sofy.getDrug();
      setState(() {
        drug = data;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

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
            Text('Drug ID : ${widget.drugId}'),
            Text('Drug Name'),
            Text('Beyond Use Date :')
          ]),
        ]),
      ),
    );
  }
}
