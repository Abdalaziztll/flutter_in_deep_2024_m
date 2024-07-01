// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_and_context/model/handling_model.dart';

class ProjectModel extends ResultModel {
  String description;
  String name;
  String status;
  ProjectModel({
    required this.description,
    required this.name,
    required this.status,
  });

  ProjectModel copyWith({
    String? description,
    String? name,
    String? status,
  }) {
    return ProjectModel(
      description: description ?? this.description,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'name': name,
      'status': status,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      description: map['description'] as String,
      name: map['name'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProjectModel(description: $description, name: $name, status: $status)';

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.name == name &&
      other.status == status;
  }

  @override
  int get hashCode => description.hashCode ^ name.hashCode ^ status.hashCode;
}
