import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_and_arch/bloc/auth_bloc.dart';
import 'package:mock_and_arch/model/user_model.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthInitial) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  LoginEvent(
                                    user: UserModel(
                                      username: username.text,
                                      password: password.text,
                                    ),
                                  ),
                                );
                          },
                          child: Text("login"));
                    } else if (state is Failed) {
                      return Text("Failed To login");
                    } else if (state is Loading) {
                      return CircularProgressIndicator();
                    } else {
                      return Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: Center(
                          child: Icon(Icons.verified),
                        ),
                      );
                    }
                  },
                )
              ],
            )),
          );
        }
      ),
    );
  }
}
