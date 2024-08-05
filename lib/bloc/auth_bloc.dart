import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tdd_project/model/data_model.dart';
import 'package:tdd_project/model/user_model.dart';
import 'package:tdd_project/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      emit(Loading());
      var data = await repo.signUp(event.user);
      if (data is DataSuccess) {
        emit(Success());
      } else {
        emit(Failed(message: (data as DataFailed).message));
      }
    });
  }
}
