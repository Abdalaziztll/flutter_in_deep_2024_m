import 'package:flutter/material.dart';
import 'package:mock_and_arch/bloc/auth_bloc.dart';
import 'package:mock_and_arch/view/auth_page.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliverPage(),
    );
  }
}

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Hello"),
            backgroundColor: Colors.blue,
            expandedHeight: 400,
          ),
          SliverList.builder(
            itemCount: 40,
            itemBuilder: (context, index) => ListTile(
              title: Text("Hello ${index}"),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Colors.red,
              thickness: 4,
            ),
          ),
          SliverGrid.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return FlutterLogo(
                size: 60,
              );
            },
          )
        ],
      ),
    );
  }
}
