import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hook_and_bloc_example/core/bloc/app_manager_bloc.dart';
import 'package:hook_and_bloc_example/core/config/bloc_observ.dart';
import 'package:hook_and_bloc_example/core/config/service_locater.dart';
import 'package:hook_and_bloc_example/hooks/hook_pages.dart';
import 'package:hook_and_bloc_example/view/auth_page.dart';
import 'package:hook_and_bloc_example/view/home_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FuturePageWithCache(),
    );
    // return BlocProvider(
    //   create: (context) => AppManagerBloc()..add(ExcuteLastRequest())..add(CheckAuthorized()),
    //   child: MaterialApp(
    //     home: BlocBuilder<AppManagerBloc, AppManagerState>(
    //       builder: (context, state) {
    //         switch (state) {
    //           case NavigateToHomePage():
    //             return HomePage();
    //           case NavigateToOffline():
    //             return OfflinePage();
    //           default:
    //             return AuthPage();
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
            onTap: () {
              context.read<AppManagerBloc>().add(RestoreToLogIn());
            },
            child: Text("There is No Internet")),
      ),
    );
  }
}
