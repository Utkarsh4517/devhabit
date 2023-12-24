import 'dart:convert';

class RoadmapModel {
  final double dayNo;
  final String day;
  final String description;
  final String task1;
  final String task2;
  final String task3;
  final bool isTask1;
  final bool isTask2;
  final bool isTask3;
  RoadmapModel({
    required this.dayNo,
    required this.day,
    required this.description,
    required this.task1,
    required this.task2,
    required this.task3,
    required this.isTask1,
    required this.isTask2,
    required this.isTask3,
  });

  Map<String, dynamic> toMap() {
    return {
      'dayNo': dayNo,
      'day': day,
      'description': description,
      'task1': task1,
      'task2': task2,
      'task3': task3,
      'isTask1': isTask1,
      'isTask2': isTask2,
      'isTask3': isTask3,
    };
  }

  factory RoadmapModel.fromMap(Map<String, dynamic> map) {
    return RoadmapModel(
      dayNo: map['dayNo'] as double,
      day: map['day'] ?? '',
      description: map['description'] ?? '',
      task1: map['task1'] ?? '',
      task2: map['task2'] ?? '',
      task3: map['task3'] ?? '',
      isTask1: map['isTask1'] ?? false,
      isTask2: map['isTask2'] ?? false,
      isTask3: map['isTask3'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoadmapModel.fromJson(String source) =>
      RoadmapModel.fromMap(json.decode(source));
}
