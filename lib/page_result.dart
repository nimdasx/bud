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
  TextEditingController tecDrugName = TextEditingController();

  Future load() async {
    try {
      var xRespone = await Sofy.getDrugList(widget.kataKunci);
      var data = xRespone['data'];
      setState(() {
        drugList = data;
      });
      tecDrugName.text = widget.kataKunci;
    } catch (error) {
      print('Error: $error');
    }
  }

  Future gundul() async {
    //print('betiga');
    try {
      var xResponse = await Sofy.getDrugList(tecDrugName.text);
      var xData = xResponse['data'];
      setState(() {
        drugList = xData;
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
            : ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Drug',
                        //style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(height: 10),
                      Container(
                        //padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Input drug name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          controller: tecDrugName,
                          onChanged: (value) {
                            gundul();
                          },
                        ),
                      ),
                      //Divider(),
                      SizedBox(height: 10),
                      for (var data in drugList)
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              drugId = data['id'];
                              //print('drugId $drugId ditekan!');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PageResultDetail(drugId),
                                ),
                              );
                            },
                            child: Text('${data['name']}'),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
