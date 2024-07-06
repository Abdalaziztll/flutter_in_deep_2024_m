import 'package:dio/dio.dart';
import 'package:mock_and_arch/model/handling.dart';
import 'package:mock_and_arch/model/user_model.dart';

class BaseService {
  Dio dio = Dio();
  late Response response;
  String baseurl = 'https://dummyjson.com/auth/login';
}

abstract class AuthService extends BaseService {
  Future<ResultModel> logIn(UserModel user);
}

class AuthServiceImp extends AuthService {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      if (response.statusCode == 200) {
        return DataSuccess();
      } else {
        return DataError();
      }
    } catch (e) {
      return ExceptionInUseCase();
    }
  }
}
