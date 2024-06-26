// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {}

class ExceptionModel extends ResultModel{}

class Litsof<T> extends ResultModel{
  List<T> listOfData;
  Litsof({
    required this.listOfData,
  });
}
