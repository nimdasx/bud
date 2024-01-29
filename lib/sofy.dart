import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sofy {
  static Future<String> readKonfig(String namaVariabel) async {
    try {
      String path =
          'assets/config.yaml'; // Path relatif dari direktori root aplikasi

      String content = await rootBundle.loadString(path);
      YamlMap yamlMap = loadYaml(content);

      // Pastikan variabel yang dicari ada dalam file YAML
      if (yamlMap.containsKey(namaVariabel)) {
        print(yamlMap[namaVariabel].toString());
        return yamlMap[namaVariabel].toString();
      } else {
        print('Variabel "$namaVariabel" tidak ditemukan dalam file YAML.');
        return '';
      }
    } catch (error) {
      print('Gagal membaca file: $error');
      return '';
    }
  }

  static Future<String> getApiKey() async {
    String telo = await readKonfig('api_key');
    print(telo);
    return telo;
  }

  /*
  didnt work
  */
  static Future<void> gundul() async {
    final String url = await readKonfig('url');
    final String user = await readKonfig('user');
    final String password = await readKonfig('password');
    final String db = await readKonfig('db');
    final client = OdooClient(url);
    try {
      await client.authenticate(db, user, password);
      final res = await client.callRPC('/web/session/modules', 'call', {});
      print('Installed modules: \n$res');
    } on OdooException catch (e) {
      print(e);
      client.close();
      //exit(-1);
    }
    client.close();
  }

  static Future getDrug() async {
    final String url = await readKonfig('url');
    final String finalUrl = '$url/sf_drug/get_list';
    try {
      Uri xurl = Uri.parse(finalUrl);
      final response = await http.get(xurl);
      if (response.statusCode == 200) {
        // Response yang sukses
        //Map<String, dynamic> data = json.decode(response.body);
        //print('Data dari API: $data');
        print(json.decode(response.body));
        List<dynamic> dataList = json.decode(response.body);
        for (var data in dataList) {
          print(
              'ID: ${data['id']}, Name: ${data['name']}, Description: ${data['description']}');
          print(data['name']);
        }
        return dataList;
        //return json.decode(response.body);
      } else {
        // Response tidak sukses
        print('Gagal mengambil data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } on PlatformException {
      print("error platform");
    }
  }
}
