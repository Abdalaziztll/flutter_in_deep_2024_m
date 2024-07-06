part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Success extends AuthState {}

class Loading extends AuthState {}

class Failed extends AuthState {}
