import 'package:hook_and_bloc_example/core/config/service_locater.dart';
import 'package:hook_and_bloc_example/model/handlgin.dart';
import 'package:hook_and_bloc_example/model/user_model.dart';
import 'package:hook_and_bloc_example/service/core_serivce.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreSerivce {
  String baseurl = 'https://dummyjson.com/auth/login';
  Future<ResultModel> logIn(UserModel user);
}

class AuthServiceImp extends AuthService {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      if (response.statusCode == 200) {
        core
            .get<SharedPreferences>()
            .setString("token", response.data['token']);
        return DataSuccess();
      } else {
        return ErrorData();
      }
    } catch (e) {
      return ErrorData();
    }
  }
}
