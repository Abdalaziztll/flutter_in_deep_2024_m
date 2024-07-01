import 'package:bloc_and_context/graphql/config.dart';
import 'package:bloc_and_context/graphql/gql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient req = getCLient();

getData() async {
  QueryResult result = await req.query(QueryOptions(document: gql(Postgql)));

  return result;
}
