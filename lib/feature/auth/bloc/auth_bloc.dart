import 'package:bloc/bloc.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:bloc_and_context/model/request/signup_user_model.dart';
import 'package:bloc_and_context/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Register>((event, emit) async {
      emit(Loading());
      ResultModel result = await AuthSeviceImp().signUp(event.user);
      if (result is DataSuccess) {
        emit(SuccessToRegister());
      } else {
        emit(Failed(message: result.runtimeType.toString()));
      }
    });
  }
}
