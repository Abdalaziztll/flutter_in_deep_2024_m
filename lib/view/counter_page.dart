import 'package:bloc_and_context/provider/useful_provider.dart';
import 'package:bloc_and_context/view/car_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Second Page"),) ,
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return InkWell(
                onTap: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text(ref.watch(counter).toString()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarPage(),
                ));
      }),
    );
  }
}
