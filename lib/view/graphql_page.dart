import 'package:bloc_and_context/graphql/api.dart';
import 'package:flutter/material.dart';

class GraphqlPage extends StatelessWidget {
  const GraphqlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 30),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
