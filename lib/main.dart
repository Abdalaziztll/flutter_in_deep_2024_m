import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/cat_api_bloc.dart';
import 'package:intro_to_bloc/config/observ_bloc.dart';
import 'package:intro_to_bloc/counter_bloc/counter_event.dart';
import 'package:intro_to_bloc/counter_bloc/counter_manager.dart';
import 'package:intro_to_bloc/counter_bloc/counter_state.dart';
import 'package:intro_to_bloc/model/product_model.dart';
import 'package:intro_to_bloc/provider/favo_provider.dart';
import 'package:intro_to_bloc/view/provider_example.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoProvider(),
      child: const MaterialApp(
        home: CatPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterManager(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterManager>().add(Increament());
                  },
                ),
                BlocBuilder<CounterManager, CounterState>(
                  builder: (context, state) {
                    if (state is AddToTheCounter) {
                      return Text(state.counter.toString());
                    } else if (state is SubTheCounter) {
                      return Text(state.counter.toString());
                    } else if (state is TheCounterIsNegative) {
                      return Text('Please Dont Push The Sub Button Again');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.minimize),
                  onPressed: () {
                    context.read<CounterManager>().add(Decreamnet());
                  },
                ),
                IconButton(
                    onPressed: () {
                      context.read<CounterManager>().add(RestoreToZero());
                    },
                    icon: Icon(Icons.exposure_zero))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatApiBloc()..add(GetDataOfCat()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              onChanged: (value) {
                context.read<CatApiBloc>().add(SearchInCat(lexem: value));
              },
            ),
          ),
          body: BlocBuilder<CatApiBloc, CatApiState>(
            builder: (context, state) {
              if (state is SuccessToGetCat) {
                return ListView.builder(
                  itemCount: state.cats.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.cats[index].name),
                    leading: Image.network(state.cats[index].image),
                  ),
                );
              } else if (state is FaildedToFetchCat) {
                return Text("Sorry");
              } else if (state is SearchResult) {
                return ListView.builder(
                  itemCount: state.cats.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.cats[index].name),
                    leading: Image.network(state.cats[index].image),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        );
      }),
    );
  }
}
