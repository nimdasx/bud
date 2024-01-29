import 'package:bud/page_result_detail.dart';
import 'package:bud/sofy.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  //const ResultPage({super.key});
  final String kataKunci;
  ResultPage(this.kataKunci);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<dynamic> drugList = [];

  Future<void> load() async {
    try {
      List<dynamic> data = await Sofy.getDrug();
      setState(() {
        drugList = data;
      });
    } catch (error) {
      // Handle error jika diperlukan
      print('Error: $error');
    }
  }

  @override
  void initState() {
    // buttonNavIndex = 0;
    super.initState();
    //apiKey = await Sofy.getApiKey();
    load();
  }

  @override
  Widget build(BuildContext context) {
    int drugId;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drug Search Result",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: drugList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Search : ${widget.kataKunci}'),
                  SizedBox(
                    height: 20,
                  ),
                  for (var data in drugList)
                    TextButton(
                      onPressed: () {
                        drugId = data['id'];
                        print('drugId $drugId ditekan!');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultDetailPage(drugId)));
                      },
                      child: Text('${data['name']}'),
                    ),
                ]),
              ]),
      ),
    );
  }
}
