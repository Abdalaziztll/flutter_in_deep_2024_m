
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hook_and_bloc_example/core/bloc/app_manager_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppManagerBloc>().add(LogOut());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Hello In Our App"),
      ),
    );
  }
}
