import 'package:bloc_and_context/model/car_model.dart';
import 'package:bloc_and_context/provider/simple_immutabel_data.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  int count = 0;
  return count;
});

final callApi = FutureProvider<CarModel>((ref) {
  return ref.read(api).getOneCar();
});

final checkInternet = StreamProvider<ConnectivityResult>((ref) {
  return ref.read(connectivity).onConnectivityChanged;
});
