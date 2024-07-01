import 'package:bloc_and_context/provider/simple_immutabel_data.dart';
import 'package:bloc_and_context/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleProviderPage extends StatelessWidget {
  const SimpleProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Page"),
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, _) {
              return Text(
                ref.read(simpleText),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounterPage(),
                ));
          },
        ));
  }
}
