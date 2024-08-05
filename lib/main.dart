import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_project/bloc/auth_bloc.dart';
import 'package:tdd_project/config/service_locater.dart';
import 'package:tdd_project/repos/auth_repo.dart';
import 'package:tdd_project/service/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => locater.get<AuthBloc>(),
        child: Scaffold(
          body: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Success) {
                  return const Text("Success");
                } else if (state is Failed) {
                  return Text(state.message);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
