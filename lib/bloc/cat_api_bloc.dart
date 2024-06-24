import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:intro_to_bloc/model/cat_model.dart';
import 'package:meta/meta.dart';

part 'cat_api_event.dart';
part 'cat_api_state.dart';

class CatApiBloc extends Bloc<CatApiEvent, CatApiState> {
  CatApiBloc() : super(CatApiInitial()) {
    List<CatModel> cats = [];
    on<GetDataOfCat>((event, emit) async {
      emit(LoadgingCat());
      try {
        Response response =
            await Dio().get("https://freetestapi.com/api/v1/cats");

        if (response.statusCode == 200) {
          cats = List.generate(
            response.data.length,
            (index) => CatModel.fromMap(response.data[index]),
          );
          emit(
            SuccessToGetCat(cats: cats),
          );
        }
      } catch (e) {
        emit(FaildedToFetchCat());
      }
    });

    List<CatModel> temp = [];
    on<SearchInCat>(
      (event, emit) {
        temp = [];
        cats.forEach((e) {
          if (e.name.contains(event.lexem)) {
            temp.add(e);
          }
        });
        emit(SearchResult(cats: temp));
      },
    );
  }
}
