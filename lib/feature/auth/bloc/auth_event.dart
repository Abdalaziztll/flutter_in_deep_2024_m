// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Register extends AuthEvent {
 final SignupUserModel user;
  Register({
    required this.user,
  });
}

class LogIn extends AuthEvent {}

class LogOut extends AuthEvent {}
