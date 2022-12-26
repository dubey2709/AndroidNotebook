import 'package:flutter/material.dart';

final String tableNotes = "notes";

class NoteFields {
  static List<String> values = [
    id,
    isImportant,
    number,
    description,
    title,
    createdTime
  ];
  static final String id = "id";
  static final String isImportant = "isImportant";
  static final String number = "number";
  static final String description = "description";
  static final String title = "title";
  static final String createdTime = "createdTime";
}

class Notes {
  final int? id;
  final bool isImportant;
  final int number;
  final String description;
  final String title;
  final DateTime createdTime;

  Notes(
      {this.id,
      required this.isImportant,
      required this.number,
      required this.description,
      required this.title,
      required this.createdTime});

  Notes copy({
    int? id,
    bool? isImportant,
    int? number,
    String? description,
    String? title,
    DateTime? createdTime,
  }) =>
      Notes(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        description: description ?? this.description,
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
      );

  static Notes fromJson(Map<String, Object?> json) => Notes(
      id: json[NoteFields.id] as int?,
      number: json[NoteFields.number] as int,
      title: json[NoteFields.title] as String,
      description: json[NoteFields.description] as String,
      createdTime: DateTime.parse(json[NoteFields.createdTime] as String),
      isImportant: json[NoteFields.isImportant] == 1);

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.title: title,
        NoteFields.createdTime: createdTime.toIso8601String()
      };
}
