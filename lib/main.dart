// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inrto_to_statemanagement/config/get_it_config.dart';
import 'package:inrto_to_statemanagement/controller/counter_controller.dart';

import 'package:inrto_to_statemanagement/model/bird_model.dart';
import 'package:inrto_to_statemanagement/model/cat_model.dart';
import 'package:inrto_to_statemanagement/model/handle_model.dart';
import 'package:inrto_to_statemanagement/service/cat_service.dart';
import 'package:provider/provider.dart';

void main() {
  // A a = A();
  // a.names.add("value");

  // A b = A();
  // print(b.names);

  init();

  runApp(MyApp());
}

// class A {
//   List<String> names = [];
//   A();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterController(),
      child: MaterialApp(
        home: TempCounterExample(),
      ),
    );
  }
}

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ValueNotifier<ResultModel> result = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageWithList(),
                  ));
            },
            icon: Icon(Icons.toc)),
      ),
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is CatModel) {
            return ListTile(
              title: Text(value.name),
              leading: Image.network(
                value.image,
                errorBuilder: (context, error, stackTrace) {
                  return FlutterLogo();
                },
              ),
            );
          } else if (value is ExceptionModel) {
            return Text(value.message);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await core.get<CatServiceImp>().getCat();
      }),
    );
  }
}

class HomePageWithList extends StatelessWidget {
  HomePageWithList({super.key});

  ValueNotifier<ResultModel> result = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is ListOf<CatModel>) {
            return ListView.builder(
                itemCount: value.modelList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.modelList[index].name),
                    leading: Image.network(
                      value.modelList[index].image,
                      errorBuilder: (context, error, stackTrace) {
                        return FlutterLogo();
                      },
                    ),
                  );
                });
          } else if (value is ExceptionModel) {
            return Text(value.message);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await CatServiceImp().getAllCat();
      }),
    );
  }
}

class HomePageWithListBird extends StatelessWidget {
  HomePageWithListBird({super.key});

  ValueNotifier<ResultModel> result = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is ListOf<BirdModel>) {
            return ListView.builder(
                itemCount: value.modelList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.modelList[index].name),
                    leading: Image.network(value.modelList[index].image),
                  );
                });
          } else if (value is ExceptionModel) {
            return Text(value.message);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await BirdServiceImp().getAllBird();
      }),
    );
  }
}

class TempCounterExample extends StatelessWidget {
  const TempCounterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              context.read<CounterController>().addToCoutner();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProviderCounter()));
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}

class ProviderCounter extends StatelessWidget {
  const ProviderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterController>(
        builder: (context, value, child) {
          return Center(
            child: Text(value.coutner.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CounterController>().addToCoutner();
      }),
    );
  }
}
