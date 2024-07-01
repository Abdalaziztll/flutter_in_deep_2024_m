import 'package:bloc_and_context/service/car_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleText = Provider<String>((ref) {
  return "Hello World";
});

final api = Provider<CarService>((ref) {
  return CarService();
});

final connectivity = Provider<Connectivity>((ref) {
  return Connectivity();
});
