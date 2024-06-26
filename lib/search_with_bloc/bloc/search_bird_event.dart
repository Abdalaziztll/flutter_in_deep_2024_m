// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bird_bloc.dart';

@immutable
sealed class SearchBirdEvent {}

class GetBirds extends SearchBirdEvent {}

class SearchInBirdLoacliy extends SearchBirdEvent {
  final String lexem;
  SearchInBirdLoacliy({
    required this.lexem,
  });
}

class SearchInBirdRemotely extends SearchBirdEvent {
  final String lexem;
  SearchInBirdRemotely({
    required this.lexem,
  });
}
