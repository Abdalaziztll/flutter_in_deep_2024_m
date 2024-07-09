part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LogIn extends AuthEvent {
 final UserModel user;

  LogIn({required this.user});
}
