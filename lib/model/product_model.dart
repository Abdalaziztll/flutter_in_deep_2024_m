// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String name;
  String price;
  String rate;
  ProductModel({
    required this.name,
    required this.price,
    required this.rate,
  });

  ProductModel copyWith({
    String? name,
    String? price,
    String? rate,
    bool? ifFav,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }
}
