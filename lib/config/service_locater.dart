import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tdd_project/bloc/auth_bloc.dart';
import 'package:tdd_project/repos/auth_repo.dart';
import 'package:tdd_project/service/auth_service.dart';

GetIt locater = GetIt.instance;

setup() {
  locater.registerSingleton(Dio());

  locater.registerSingleton(AuthService(locater.get()));

  locater.registerSingleton(AuthRepo(locater.get()));

  locater.registerSingleton(AuthBloc(locater.get()));
}
