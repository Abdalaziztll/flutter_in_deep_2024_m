
import 'package:flutter/material.dart';
import 'package:intro_to_bloc/model/product_model.dart';
import 'package:intro_to_bloc/provider/favo_provider.dart';
import 'package:provider/provider.dart';

List<ProductModel> products = [
  ProductModel(name: 'Nokia', price: '30', rate: '3'),
  ProductModel(name: 'Apple', price: '30', rate: '3'),
  ProductModel(name: 'Samasung', price: '30', rate: '3'),
  ProductModel(name: 'HTC', price: '30', rate: '3'),
  ProductModel(name: 'Sony', price: '30', rate: '3'),
];

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoProvider>(builder: (context, value, _) {
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(products[index].name),
            trailing: IconButton(
                onPressed: () {
                  if (value.favorites.contains(products[index])) {
                    context
                        .read<FavoProvider>()
                        .removeFromFavoritByProduct(products[index]);
                  } else {
                    context
                        .read<FavoProvider>()
                        .addProductToFav(products[index]);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: (context
                          .read<FavoProvider>()
                          .favorites
                          .contains(products[index])
                      ? Colors.red
                      : Colors.grey),
                )),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(),
            ));
      }),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<FavoProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.favorites.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(value.favorites[index].name),
                trailing: IconButton(
                    onPressed: () {
                      context
                          .read<FavoProvider>()
                          .removeFromFavoritByIndex(index);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ),
            );
          },
        ));
  }
}
