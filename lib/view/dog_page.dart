import 'package:arch_and_getx/controller/dog_controller.dart';
import 'package:arch_and_getx/model/dog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogPage extends StatelessWidget {
  DogPage({super.key});

  final contoller = Get.put(DogController());

  @override
  Widget build(BuildContext context) {
    contoller.getDog();
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            if (contoller.dog.value is DogModel) {
              DogModel dog = contoller.dog.value as DogModel;
              return ListTile(
                title: Text(dog.name),
                subtitle: Text(dog.origin),
                leading: Image.network(dog.image),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
          Obx(() {
            return Text((Get.find<DogController>().dog.value).toString());
          })
        ],
      ),
    );
  }
}
