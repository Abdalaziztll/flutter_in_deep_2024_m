import 'package:bloc_and_context/provider/useful_provider.dart';
import 'package:bloc_and_context/view/car_page.dart';
import 'package:bloc_and_context/view/graphql_page.dart';
import 'package:bloc_and_context/view/no_internet_page.dart';
import 'package:bloc_and_context/view/simple_provider_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async{
   await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: GraphqlPage(),
        // home: Consumer(builder: (context, ref, _) {
        //   return ref.read(checkInternet).when(
        //     data: (data) {
        //       if (data == ConnectivityResult.wifi) {
        //         return CarPage();
        //       } else {
        //         return NoInternetPage();
        //       }
        //     },
        //     error: (error, stackTrace) {
        //       return SimpleProviderPage();
        //     },
        //     loading: () {
        //       return LinearProgressIndicator();
        //     },
        //   );
        // }),
      ),
    );
  }
}

Stream<int> countTo1000() async* {
  for (var i = 0; i < 1000; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

class StreamExample extends StatelessWidget {
  const StreamExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: countTo1000(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
