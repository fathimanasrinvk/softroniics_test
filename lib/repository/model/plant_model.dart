// lib/repository/model/plant_model.dart
import 'dart:convert';

class Plant {
  final String name;
  final String description;
  final String imagePath;

  Plant({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'imagePath': imagePath,
  };

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    name: json['name'],
    description: json['description'],
    imagePath: json['imagePath'],
  );
}
