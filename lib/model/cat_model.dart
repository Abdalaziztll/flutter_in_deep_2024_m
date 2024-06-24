import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatModel {
  String name;
  String image;
  CatModel({
    required this.name,
    required this.image,
  });

  CatModel copyWith({
    String? name,
    String? image,
  }) {
    return CatModel(
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

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) => CatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant CatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
