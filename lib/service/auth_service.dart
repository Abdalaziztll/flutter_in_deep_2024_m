import 'package:dio/dio.dart';
import 'package:tdd_project/handling_error/handle_auth_message.dart';
import 'package:tdd_project/model/user_model.dart';

class AuthService {
  final Dio dio;
  late Response response;
  final String baseurl =
      "https://rideshare.devscape.online/api/v1/auth/register";

  AuthService(this.dio);

  Future<bool> signup(UserModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      return true;
    } on DioException catch (e) {
      // if (e.response!.data['message']
      //     .contains("Password must contain 1 or more special characters")) {
        throw PasswordHasNotSpeicalCharcter();
      // }
    }
  }
}
