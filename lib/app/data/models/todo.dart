// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

Todo todosFromJson(String str) => Todo.fromJson(json.decode(str));

String todosToJson(Todo data) => json.encode(data.toJson());

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}
