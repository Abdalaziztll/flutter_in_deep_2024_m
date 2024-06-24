import 'package:flutter/material.dart';
import 'package:intro_to_bloc/model/product_model.dart';

class FavoProvider extends ChangeNotifier {
  List<ProductModel> favorites = [];

  addProductToFav(ProductModel product) {
    if (favorites.contains(product)) {
    } else {
      favorites.add(product);
      notifyListeners();
    }
  }

  removeFromFavoritByIndex(int index) {
    favorites.removeAt(index);
    notifyListeners();
  }

  removeFromFavoritByProduct(ProductModel product) {
    favorites.remove(product);
    notifyListeners();
  }
}
