import 'package:hybrid_3/Classes/all_classes.dart';

import 'dart:convert' as convert;
import 'dart:io';

Future<List<Map<String, String>>> readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = await convert.jsonDecode(input);
// Seems like I needed to convert each field to a Map<String, String> type as it was being read as a Map<String, dynamic> type for some reason.
  List<Map<String, String>> output = (map['fields'] as List).map((singleField) => 
   Map<String, String>.from(singleField as Map<String, dynamic>)
  ).toList();
  return output;
}

void main() async {
  var output = await readJsonFile('/Users/wallacezhao/Documents/Dart/hybrid-3/mock-data/mockdata.json');

  if(output.isNotEmpty) {
    Student student = Student(output);
    // student.people = output;
    final sortedFields = student.toSort("first");
    for( var field in sortedFields) {
      print(field);
    }

  }
}
