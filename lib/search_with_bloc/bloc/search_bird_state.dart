// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bird_bloc.dart';

@immutable
sealed class SearchBirdState {}

final class SearchBirdInitial extends SearchBirdState {}

class SuccessToGetBird extends SearchBirdState {
  final List<BirdModel> birds;
  SuccessToGetBird({
    required this.birds,
  });
}

class ErrorState extends  SearchBirdState {}


class SearchResult extends SearchBirdState {
   final List<BirdModel> birds;
  SearchResult({
    required this.birds,
  });
}

class SearchResultRemotyl extends SearchBirdState {
   final List<BirdModel> birds;
  SearchResultRemotyl({
    required this.birds,
  });
}

class LoadingState extends SearchBirdState {}