import 'package:bloc_and_context/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_and_context/model/request/signup_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  controller: email,
                ),
                TextField(
                  controller: firstName,
                ),
                TextField(
                  controller: lastName,
                ),
                TextField(
                  controller: password,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is AuthInitial) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  Register(
                                    user: SignupUserModel(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      email: email.text,
                                      role: 'USER',
                                      password: password.text,
                                    ),
                                  ),
                                );
                          },
                          child: Text("Register"));
                    } else if (state is Failed) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                        Register(
                                          user: SignupUserModel(
                                            firstName: firstName.text,
                                            lastName: lastName.text,
                                            email: email.text,
                                            role: 'USER',
                                            password: password.text,
                                          ),
                                        ),
                                      );
                                },
                                child: Text("Register")),
                            Text(
                              state.message,
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            )
                          ],
                        ),
                      );
                    } else if (state is SuccessToRegister) {
                      return Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: Center(
                          child: Icon(
                            Icons.verified,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
