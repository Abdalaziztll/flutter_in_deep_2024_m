import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mock_and_arch/model/handling.dart';
import 'package:mock_and_arch/model/user_model.dart';
import 'package:mock_and_arch/service/mock/mock_auth_service.dart';
import 'package:mock_and_arch/service/real/service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event.user.isEmpty()) {
        emit(Failed());
      } else {
        emit(Loading());
        ResultModel temp = await AuthServiceImp().logIn(event.user);
        if (temp is DataSuccess) {
          emit(Success());
        } else {
          emit(Failed());
        }
      }
    });
  }
}
