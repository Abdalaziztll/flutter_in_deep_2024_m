// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arch_and_getx/model/handling.dart';


class DogModel extends ResultModel {
  String name;
  String image;
  String origin;
  DogModel({
    required this.name,
    required this.image,
    required this.origin,
  });

  DogModel copyWith({
    String? name,
    String? image,
    String? origin,
  }) {
    return DogModel(
      name: name ?? this.name,
      image: image ?? this.image,
      origin: origin ?? this.origin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'origin': origin,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      name: map['name'] as String,
      image: map['image'] as String,
      origin: map['origin'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) => DogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DogModel(name: $name, image: $image, origin: $origin)';

  @override
  bool operator ==(covariant DogModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.origin == origin;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ origin.hashCode;
}
