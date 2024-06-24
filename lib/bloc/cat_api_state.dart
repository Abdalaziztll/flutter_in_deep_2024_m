// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cat_api_bloc.dart';

@immutable
sealed class CatApiState {}

final class CatApiInitial extends CatApiState {}

class SuccessToGetCat extends CatApiState {
  final List<CatModel> cats;
  SuccessToGetCat({
    required this.cats,
  });
}

class SearchResult extends CatApiState {
 final List<CatModel> cats;
  SearchResult({
    required this.cats,
  });
}

class LoadgingCat extends CatApiState {}

class FaildedToFetchCat extends CatApiState {}
