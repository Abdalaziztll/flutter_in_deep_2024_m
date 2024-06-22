import 'package:dio/dio.dart';
import 'package:inrto_to_statemanagement/model/bird_model.dart';
import 'package:inrto_to_statemanagement/model/cat_model.dart';
import 'package:inrto_to_statemanagement/model/handle_model.dart';

abstract class Service {
  Dio req = Dio();
  late Response response;
  String baseurl = "https://freetestapi.com/api/v1/";
}

abstract class CatService extends Service {
  Future<ResultModel> getCat();
  Future<ResultModel> getAllCat();
}

class CatServiceImp extends CatService {
  CatModel? cat;

  List<CatModel> cats = [];

  @override
  Future<ResultModel> getCat() async {
    try {
      if (cat != null) {
        print("From Cache");
        return cat!;
      } else {
        print("From Server");
        response = await req.get(baseurl + 'cats/1');
        if (response.statusCode == 200) {
          cat = CatModel.fromMap(response.data);

          return cat!;
        } else {
          return ErrorModel(message: "There is no Internet");
        }
      }
    } catch (e) {
      return ExceptionModel(message: e.toString());
    }
  }

  @override
  Future<ResultModel> getAllCat() async {
    try {
      if (cats.isNotEmpty) {
        return ListOf(modelList: cats);
      } else {
        response = await req.get(baseurl + "cats");
        if (response.statusCode == 200) {
          return ListOf<CatModel>(
              modelList: List.generate(
            response.data.length,
            (index) => CatModel.fromMap(response.data[index]),
          ));
        } else {
          return ErrorModel(message: 'There Is a Problem');
        }
      }
    } catch (e) {
      return ExceptionModel(message: e.toString());
    }
  }
}

abstract class BirdService extends Service {
  Future<ResultModel> getAllBird();
}

class BirdServiceImp extends BirdService {
  @override
  Future<ResultModel> getAllBird() async {
    try {
      response = await req.get(baseurl + "birds");
      if (response.statusCode == 200) {
        return ListOf<BirdModel>(
            modelList: List.generate(
          response.data.length,
          (index) => BirdModel.fromMap(response.data[index]),
        ));
      } else {
        return ErrorModel(message: 'There Is a Problem');
      }
    } catch (e) {
      return ExceptionModel(message: e.toString());
    }
  }
}
