import 'dart:core';

class Student {
  List<Map<String, String>> people = [];

  Student() {
    print('Student class constructor');
  }

  void toSort(people) {
    people.sort();
  }
}
