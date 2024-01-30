import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';

class PageResultDetail extends StatefulWidget {
  //const ResultDetailPage({super.key});
  final int drugId;
  PageResultDetail(this.drugId);

  @override
  State<PageResultDetail> createState() => _PageResultDetailState();
}

class _PageResultDetailState extends State<PageResultDetail> {
  var drug = {};

  Future<void> load() async {
    try {
      var xRespone = await Sofy.getDrug(widget.drugId);
      var data = xRespone['data'];
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
          "Beyond Use Date Information",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: drug.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Drug ID : ${widget.drugId}'),
                  Text('Drug Name : ${drug['name']}'),
                  Text('Beyond Use Date :'),
                  for (var bud in drug['sf_drug_bud_list'])
                    Text('X : ${bud['sentence']}'),
                ]),
              ]),
      ),
    );
  }
}
