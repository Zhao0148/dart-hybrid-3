import 'package:hybrid_3/Classes/all_classes.dart';

import 'dart:convert';
import 'dart:io';

Future<List<Map<String, dynamic>>> readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = await jsonDecode(input);
  return (map['fields']).cast<Map<String, dynamic>>();
}

void main(List<String> arguments) async {
  var output = await readJsonFile('/Users/wallacezhao/Documents/Dart/hybrid-3/mock-data/mockdata.json');
  print(output);
}
