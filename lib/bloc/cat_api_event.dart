// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cat_api_bloc.dart';

@immutable
sealed class CatApiEvent {}

class GetDataOfCat extends CatApiEvent {}

class SearchInCat extends CatApiEvent {
 final String lexem;
  SearchInCat({
    required this.lexem,
  });
}
