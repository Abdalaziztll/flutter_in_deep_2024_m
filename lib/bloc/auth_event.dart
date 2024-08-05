part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent {
 final UserModel user;

  SignUp(this.user);

}
