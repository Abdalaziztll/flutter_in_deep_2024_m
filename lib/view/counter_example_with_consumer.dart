import 'package:bloc_and_context/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageEdiWithConsumer extends StatelessWidget {
  const HomePageEdiWithConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("This page is Consumer Page example"),
          ),
          body: Center(
            child: BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                print("From Consumer Lisnter");
                if (state is IncreamentCounter) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("The Counter Has Added"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is IncreamentCounter) {
                  return IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Add());
                    },
                    icon: Icon(Icons.abc),
                  );
                }
                if (state is CounterInitial) {
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
          ));
    });
  }
}
