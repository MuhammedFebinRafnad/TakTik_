import 'dart:convert';

class DisplayTaskModel {
  final String title;
  final String category;
  final DateTime dueDate;

  DisplayTaskModel({required this.title, required this.category, required this.dueDate});
  factory DisplayTaskModel.fromJson(Map<String,dynamic>json){
    return DisplayTaskModel(
      title:json["title"],
    category:json["category"],
      dueDate: DateTime.parse(json["dueDate"])
      );
  }
  
}