import 'package:bloc_and_context/bloc/counter_bloc.dart';
import 'package:bloc_and_context/view/bird_page.dart';
import 'package:bloc_and_context/view/counter_example_with_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<CounterBloc>(),
                          child: HomePageEdi(),
                        ),
                      ),
                    );
                  },
                  icon:const Icon(Icons.add)),
            ),
            body: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 200),
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.blue,
                textStyle: TextStyle(color: Colors.black),
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                context.read<CounterBloc>().add(Add());
              },
              child:const Text(
                "Press me",
                style: TextStyle(color: Colors.yellow),
              ),
            )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              label:const Text(
                "Hello",
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageEdi extends StatelessWidget {
  const HomePageEdi({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("This Page BlocPorviderByValue Example"),
        ),
        body: Center(
          child: BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncreamentCounter) {
                print("From Provider By Value Lisnter");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<CounterBloc>(),
                      child: HomePageEdiWithConsumer(),
                    ),
                  ),
                );
              }
            },
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Add());
                    },
                    icon: Icon(Icons.abc),
                  );
                }
                if (state is IncreamentCounter) {
                  return IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Add());
                    },
                    icon: Icon(Icons.abc),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      );
    });
  }
}
