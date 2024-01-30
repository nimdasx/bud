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
        print(drug);
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
        title: Row(
          children: [
            Icon(Icons.compost),
            SizedBox(width: 5),
            Text("Drug BUD Information"),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: drug.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //Text('Drug ID : ${widget.drugId}'),
                  xColumn('Drug Name', drug['name']),
                  xColumn('Drug Concentration', drug['drug_concentration']),
                  xColumn('Descriptoin/Source', drug['description']),
                  xColumn('Category', drug['sf_catdrug_name']),
                  Divider(),
                  Text(
                    'Beyond Use Date Information',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  for (var bud in drug['sf_drug_bud_list'])
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.amber,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        bud['sentence'],
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    )
                ]),
              ]),
      ),
    );
  }

  Column xColumn(String xJudul, String xValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          xJudul,
          style: TextStyle(
            fontSize: 10,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Text(xValue),
        SizedBox(height: 5),
      ],
    );
  }

  Text textJudul(String judul) {
    return Text(
      judul,
      style: TextStyle(
        fontSize: 11,
      ),
    );
  }
}
