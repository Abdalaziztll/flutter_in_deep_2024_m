import 'package:mock_and_arch/model/handling.dart';
import 'package:mock_and_arch/model/user_model.dart';
import 'package:mock_and_arch/service/real/service.dart';
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements AuthServiceImp {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    await Future.delayed(Duration(seconds: 1));

    if (user.toMap().isNotEmpty) {
      return DataSuccess();
    } else {
      return DataError();
    }
  }
}
