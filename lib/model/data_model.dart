// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataSuccess extends ResultModel {}

class DataFailed extends ResultModel {
 final String message;
  DataFailed({
    required this.message,
  });
}

class ResultModel {}
