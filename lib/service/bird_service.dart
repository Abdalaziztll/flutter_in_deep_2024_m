import 'package:bloc_and_context/model/bird_model.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:dio/dio.dart';

abstract class Service {
  Dio req = Dio();
  late Response response;
}

abstract class BirdService extends Service {
  String baseurl = "https://freetestapi.com/api/v1/birds";

  Future<ResultModel> getAllBirds();
  Future<ResultModel> searchInBird(String lexem);
}

class BirdServiceImp extends BirdService {
  @override
  Future<ResultModel> getAllBirds() async {
    try {
      response = await req.get(baseurl);
      if (response.statusCode == 200) {
        return Litsof<BirdModel>(
            listOfData: List.generate(response.data.length,
                (index) => BirdModel.fromMap(response.data[index])));
      } else {
        return ExceptionModel();
      }
    } catch (e) {
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> searchInBird(String lexem)async {
    try {
      response = await req.get(baseurl+"?search=${lexem}");
      if (response.statusCode == 200) {
        return Litsof<BirdModel>(
            listOfData: List.generate(response.data.length,
                (index) => BirdModel.fromMap(response.data[index])));
      } else {
        return ExceptionModel();
      }
    } catch (e) {
      return ExceptionModel();
    }
  }
}
