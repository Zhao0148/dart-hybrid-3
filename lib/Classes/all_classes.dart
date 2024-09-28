import 'dart:core';

enum ValidFields { first, last, email }

class Student {
  List<Map<String, String>> people = [];

  Student(List<Map<String, String>> listOfFields) {
    this.people = listOfFields;
  }

  toSort(String? field) {
    if (people.isEmpty) {
      return [];
    }
// check for null values
    var isField = people[0].keys;
    print(isField);
    if (isField.contains("$field")) {
      people.sort((a, b) {
        if (a["$field"] != null && b["$field"] != null && a["$field"] is String && b["$field"] is String) {
          var firstElement = a["$field"]!;
          var secondElement = b["$field"]!;
          var comparison = firstElement.compareTo(secondElement);
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

  output() {
    for (var field in people) {
      print(field);
    }
  }

  plus(Map<String, String> person) {
    print("person: $person");
    if (person.isEmpty) return;

    bool isValid = ValidFields.values.every((field) => person.containsKey(field.name)) && person.length == ValidFields.values.length;
    print(isValid);
    if (isValid) {
      people.add(person);
    } else {
      print('Invalid field');
    }
  }

  remove(String field) {
    people.removeWhere((personObject) => personObject['first'] == field);
  }
}
