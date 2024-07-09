import 'package:bloc/bloc.dart';
import 'package:hook_and_bloc_example/bloc/auth_bloc.dart';
import 'package:hook_and_bloc_example/core/config/service_locater.dart';
import 'package:hook_and_bloc_example/model/handlgin.dart';
import 'package:hook_and_bloc_example/model/user_model.dart';
import 'package:hook_and_bloc_example/service/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  AppManagerBloc() : super(NavigateToLogIn()) {
    on<CheckAuthorized>((event, emit) {
      if (core.get<SharedPreferences>().getString('token') == null ||core.get<SharedPreferences>().getString('token') =='') {
        emit(NavigateToLogIn());
      } else {
        emit(NavigateToHomePage());
      }
    });

    on<HeLoggedIn>((event, emit) {
      emit(NavigateToHomePage());
    });

    on<HeFailedToLoggedIn>((event, emit) => emit(NavigateToOffline()));

    on<RestoreToLogIn>((event, emit) => emit(NavigateToLogIn()));

    on<LogOut>((event, emit) {
      core.get<SharedPreferences>().setString('token', '');
      emit(NavigateToLogIn());
    });

    on<ExcuteLastRequest>((event, emit) async {
      ResultModel result = await AuthServiceImp().logIn(
          UserModel.fromJson(core.get<SharedPreferences>().getString('data')!));
      if (result is DataSuccess) {
        emit(NavigateToHomePage());
      } else {
        emit(NavigateToOffline());
      }
    });
  }
}
