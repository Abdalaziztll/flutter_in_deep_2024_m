part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitial extends AppManagerState {}

class NavigateToLogIn extends AppManagerState {}

class NavigateToOffline extends AppManagerState {}

class NavigateToHomePage extends AppManagerState {}

