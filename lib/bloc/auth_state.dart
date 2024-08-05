// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Failed extends AuthState {
 final String message;
  Failed({
    required this.message,
  });
}


class Success extends AuthState {}