import 'package:bud/page_result_detail.dart';
import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';

class PageResult extends StatefulWidget {
  //const ResultPage({super.key});
  final String kataKunci;
  PageResult(this.kataKunci);

  @override
  State<PageResult> createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> {
  var drugList = [];

  Future load() async {
    try {
      var xRespone = await Sofy.getDrugList(widget.kataKunci);
      var data = xRespone['data'];
      setState(() {
        drugList = data;
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
    int drugId;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.compost),
            SizedBox(
              width: 5,
            ),
            Text(
              "Drug List",
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: drugList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Search Key',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(widget.kataKunci),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  for (var data in drugList)
                    Container(
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () {
                          drugId = data['id'];
                          //print('drugId $drugId ditekan!');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PageResultDetail(drugId)));
                        },
                        child: Text('${data['name']}'),
                      ),
                    ),
                ]),
              ]),
      ),
    );
  }
}
