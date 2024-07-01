import 'package:bloc_and_context/core/config/bloc_observe_config.dart';
import 'package:bloc_and_context/core/config/get_it_config.dart';
import 'package:bloc_and_context/feature/auth/view/register_page.dart';
import 'package:bloc_and_context/feature/project/view/proejct_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await  setup();
  Bloc.observer = MyBlocObserver();
  print(core.get<SharedPreferences>().getString('token'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (core.get<SharedPreferences>().getString('token') == null)
            ? RegisterPage()
            : ProjectPage());
  }
}
