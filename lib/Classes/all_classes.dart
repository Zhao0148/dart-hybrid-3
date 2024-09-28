import 'dart:core';

class Student {
  List<Map<String, String>> people = [];

  Student(List<Map<String, String>> people) {
    this.people = people;
    // this.people ;
    print('Student class constructor');
  }

  toSort(String? field) {
    if (people.isEmpty) {
      return [];
    }
// check for null values
    var isField = people[0].keys;
    if (isField.contains("$field")) {
      print('first exists');
      people.sort((a, b) {
        if (a["$field"] != null && b["$field"] != null && a["$field"] is String && b["$field"] is String) {
          var firstElement = a["$field"]!;
          var secondElement = b["$field"]!;
          var comparison =  firstElement.compareTo(secondElement);
          print("comparison: $comparison");
          return comparison;

        } else {
          
          return 0;
        }
      });
      
      return people;
    } else {
      print('first does not exist');
    }

  }
}
