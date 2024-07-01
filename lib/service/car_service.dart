// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc_and_context/model/car_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CarService {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://freetestapi.com/api/v1/cars/1";

  Future<CarModel> getOneCar() async {
    try {
      response = await dio.get(baseurl);
      if (response.statusCode == 200) {
        return CarModel.fromMap(response.data);
      } else {
        throw Exception('This is Not 200');
      }
    } on DioException catch (e) {
      throw e;
    }
  }
}
