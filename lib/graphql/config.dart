import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient getCLient() {
  final HttpLink httpLink = HttpLink(
    'https://graphqlzero.almansi.me/api',
  );

  return GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );
}
