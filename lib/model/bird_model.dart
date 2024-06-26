// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_and_context/model/handling_model.dart';

class BirdModel extends ResultModel{
  String name;
  String image;
  BirdModel({
    required this.name,
    required this.image,
  });

  BirdModel copyWith({
    String? name,
    String? image,
  }) {
    return BirdModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory BirdModel.fromMap(Map<String, dynamic> map) {
    return BirdModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirdModel.fromJson(String source) => BirdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BirdModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant BirdModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
