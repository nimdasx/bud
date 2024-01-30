import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sofy {
  static String namaAplikasi = 'BiyudFormer';

  static Future<String> readKonfig(String namaVariabel) async {
    try {
      String path = 'assets/config.yaml';

      String content = await rootBundle.loadString(path);
      YamlMap yamlMap = loadYaml(content);

      if (yamlMap.containsKey(namaVariabel)) {
        //print(yamlMap[namaVariabel].toString());
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

  static Future getDrugList(String searchParam) async {
    final String url = await readKonfig('url');
    final String finalUrl = '$url/sf_drug/get_list';
    try {
      Uri xurl = Uri.parse(finalUrl);

      // Menambahkan query parameter search_param jika tidak null atau kosong
      if (searchParam.isNotEmpty) {
        xurl = xurl.replace(queryParameters: {'search_param': searchParam});
      }

      final response = await http.get(xurl);
      if (response.statusCode == 200) {
        var sapi = json.decode(response.body);
        // var data = sapi['data'];
        // for (var x in data) {
        //   print(
        //       'id: ${x['id']}, name: ${x['name']}, description: ${x['description']}');
        // }
        return sapi;
      } else {
        print('Gagal mengambil data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } on PlatformException {
      print("error platform");
    }
  }

  static Future getDrug(int drugId) async {
    final String url = await readKonfig('url');
    final String finalUrl = '$url/sf_drug/get/$drugId';
    try {
      Uri xurl = Uri.parse(finalUrl);
      final response = await http.get(xurl);
      if (response.statusCode == 200) {
        var sapi = json.decode(response.body);
        //print(sapi['data']);
        return sapi;
      } else {
        print('Gagal mengambil data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } on PlatformException {
      print("error platform");
    }
  }
}
