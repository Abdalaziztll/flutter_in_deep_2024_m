import 'package:bloc/bloc.dart';
import 'package:bloc_and_context/model/bird_model.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:bloc_and_context/service/bird_service.dart';
import 'package:meta/meta.dart';

part 'search_bird_event.dart';
part 'search_bird_state.dart';

class SearchBirdBloc extends Bloc<SearchBirdEvent, SearchBirdState> {
  SearchBirdBloc() : super(SearchBirdInitial()) {
    List<BirdModel> birds = [];

    on<GetBirds>((event, emit) async {
      ResultModel result = await BirdServiceImp().getAllBirds();
      if (result is Litsof<BirdModel>) {
        birds = result.listOfData;
        emit(SuccessToGetBird(birds: birds));
      } else {
        emit(ErrorState());
      }
    });
    List<BirdModel> resultOfSearch = [];
    on<SearchInBirdLoacliy>(
      (event, emit) {
        resultOfSearch = [];
        emit(LoadingState());
        birds.forEach((element) {
          if (element.name.contains(event.lexem)) {
            resultOfSearch.add(element);
          }
        });
        emit(SearchResult(birds: resultOfSearch));
      },
    );

    on<SearchInBirdRemotely>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await BirdServiceImp().searchInBird(event.lexem);
      if (result is Litsof<BirdModel>) {
        birds = result.listOfData;
        emit(SearchResultRemotyl(birds: birds));
      } else {
        emit(ErrorState());
      }
    });

  }
}
