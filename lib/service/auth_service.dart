import 'package:bloc_and_context/core/config/get_it_config.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:bloc_and_context/model/request/signup_user_model.dart';
import 'package:bloc_and_context/service/core_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SignupUserModel user);
  Future<ResultModel> logIn();
  Future<ResultModel> logOut();
  Future<ResultModel> resestPassword();
}

class AuthSeviceImp extends AuthService {
  @override
  Future<ResultModel> logIn() {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> resestPassword() {
    // TODO: implement resestPassword
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> signUp(SignupUserModel user) async {
    try {
      response = await dio.post(baseurl + "/auth/register", data: user.toMap());
      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        core.get<SharedPreferences>().setString('token', token);
        return DataSuccess();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
