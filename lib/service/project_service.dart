import 'package:bloc_and_context/core/config/get_it_config.dart';
import 'package:bloc_and_context/core/config/header_config.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:bloc_and_context/model/response/project_model.dart';
import 'package:bloc_and_context/service/core_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProjectService extends CoreService {
  Future<ResultModel> getAllProject();
}

class ProkectServiceImp extends ProjectService {
  @override
  Future<ResultModel> getAllProject() async {
    try {
      response = await dio.get(
        baseurl + '/projects',
        options: HeaderConfig.getHeader(),
      );
      if (response.statusCode == 200) {
        return ListOf<ProjectModel>(
          listOfData: List.generate(
            response.data.length,
            (index) => ProjectModel.fromMap(
              response.data[index],
            ),
          ),
        );
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(
        message: e.message!,
      );
    }
  }
}
