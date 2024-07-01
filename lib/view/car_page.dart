import 'package:bloc_and_context/provider/useful_provider.dart';
import 'package:bloc_and_context/service/car_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Page"),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return ref.watch(callApi).when(
            data: (data) {
              return ListTile(
                title: Text(data.make),
                subtitle: Text(data.color),
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            },
          );
        }),
      ),
    );
  }
}
