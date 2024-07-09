import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hook_and_bloc_example/bloc/auth_bloc.dart';
import 'package:hook_and_bloc_example/core/bloc/app_manager_bloc.dart';
import 'package:hook_and_bloc_example/model/user_model.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: username,
                ),
                TextField(
                  controller: password,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SuccessToLogIn) {
                      context.read<AppManagerBloc>().add(HeLoggedIn());
                    }
                    if (state is FailedToLogIn) {
                      context.read<AppManagerBloc>().add(HeFailedToLoggedIn());
                    }
                  },
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LogIn(
                            user: UserModel(
                                username: username.text,
                                password: password.text)));
                      },
                      child: Text("Login")),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
