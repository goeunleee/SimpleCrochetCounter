// project.dart
import 'dart:convert';

class Project {
  String title;
  int counter;

  Project({required this.title, required this.counter});

  // JSON으로 변환
  String toJson() {
    return jsonEncode({'title': title, 'counter': counter});
  }

  // JSON에서 객체로 변환
  factory Project.fromJson(String jsonString) {
    Map<String, dynamic> data = jsonDecode(jsonString);
    return Project(
      title: data['title'],
      counter: data['counter'],
    );
  }
}
