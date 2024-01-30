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
  Map<String, dynamic>? drug;

  Future<void> load() async {
    try {
      Map<String, dynamic> data = await Sofy.getDrug(widget.drugId);
      setState(() {
        drug = data;
        // print(drug?['sf_drug_bud_list']);
        // for (var bud in drug?['sf_drug_bud_list']) {
        //   print(
        //       'ID: ${bud['id']}, Name: ${bud['sf_solvent_id']}, Description: ${bud['sentence']}');
        //   print(bud['name']);
        // }
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
          "Beyond Use Date Information",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: drug == null
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Drug ID : ${widget.drugId}'),
                  Text('Drug Name : ${drug?['name']}'),
                  Text('Beyond Use Date :'),
                  for (var bud in drug?['sf_drug_bud_list'])
                    Text('X : ${bud['sentence']}'),
                ]),
              ]),
      ),
    );
  }
}
