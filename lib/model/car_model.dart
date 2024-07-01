// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarModel {
  String image;
  String make;
  String color;
  CarModel({
    required this.image,
    required this.make,
    required this.color,
  });

  CarModel copyWith({
    String? image,
    String? make,
    String? color,
  }) {
    return CarModel(
      image: image ?? this.image,
      make: make ?? this.make,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'make': make,
      'color': color,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      image: map['image'] as String,
      make: map['make'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) => CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarModel(image: $image, make: $make, color: $color)';

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.make == make &&
      other.color == color;
  }

  @override
  int get hashCode => image.hashCode ^ make.hashCode ^ color.hashCode;
}
