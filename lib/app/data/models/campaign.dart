import 'dart:convert';

class Campaign {
  final String? id;
  final String? imagePath;
  final String? title;
  final String? description;
  final int? amount;

  Campaign({
    this.id,
    this.imagePath,
    this.title,
    this.description,
    this.amount,
  });

  factory Campaign.fromRawJson(String str) =>
      Campaign.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json['\$id'],
        imagePath: json['imagePath'],
        title: json['title'],
        description: json['description'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'imagePath': imagePath,
        'title': title,
        'description': description,
        'amount': amount,
      };
}
