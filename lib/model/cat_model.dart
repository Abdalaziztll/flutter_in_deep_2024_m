import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CatModel {
  String? name;
  String? origin;
  String? image;
  int? id;
  CatModel({
    this.name,
    this.origin,
    this.image,
    this.id,
  });

  CatModel copyWith({
    String? name,
    String? origin,
    String? image,
    int? id,
  }) {
    return CatModel(
      name: name ?? this.name,
      origin: origin ?? this.origin,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'origin': origin,
      'image': image,
      'id': id,
    };
  }

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      name: map['name'] != null ? map['name'] as String : null,
      origin: map['origin'] != null ? map['origin'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) => CatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatModel(name: $name, origin: $origin, image: $image, id: $id)';
  }

  @override
  bool operator ==(covariant CatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.origin == origin &&
      other.image == image &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      origin.hashCode ^
      image.hashCode ^
      id.hashCode;
  }
}
