import 'package:arch_and_getx/model/dog_model.dart';
import 'package:arch_and_getx/model/handling.dart';
import 'package:arch_and_getx/view/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogController extends GetxController {
  Rx<ResultModel> dog = ResultModel().obs;

  getDog() async {
    var response =
        await GetConnect().get("https://freetestapi.com/api/v1/dogs/1");
    print(response.body);
    if (response.isOk) {
      dog.value = DogModel.fromMap(response.body);
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: 'No INternet ',
        backgroundColor: Colors.red,
      ));
      Get.to(() => NoInternetPage());
    }
  }
}
