part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerEvent {}


class HeLoggedIn extends AppManagerEvent {

}

class HeFailedToLoggedIn extends AppManagerEvent {}

class RestoreToLogIn extends AppManagerEvent {}

class CheckAuthorized extends AppManagerEvent {}

class LogOut extends  AppManagerEvent {}

class ExcuteLastRequest extends AppManagerEvent {}