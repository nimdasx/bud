import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;

class Sofy {
  static Future<String> readKonfig(String namaVariabel) async {
    try {
      String path =
          'assets/config.yaml'; // Path relatif dari direktori root aplikasi

      String content = await rootBundle.loadString(path);
      YamlMap yamlMap = loadYaml(content);

      // Pastikan variabel yang dicari ada dalam file YAML
      if (yamlMap.containsKey(namaVariabel)) {
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
}
