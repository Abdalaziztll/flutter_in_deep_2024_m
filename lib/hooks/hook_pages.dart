import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      body: Center(
        child: Text(counter.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }
}

class CountDownPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    useEffect(() {
      var tt = Timer.periodic(Duration(seconds: 1), (t) {
        counter.value = t.tick;
      });
    }, []);

    return Scaffold(
      body: Center(
        child: Text(counter.value.toString()),
      ),
    );
  }
}

class FuturePageWithCache extends HookWidget {
  const FuturePageWithCache({super.key});

  @override
  Widget build(BuildContext context) {

    final counter = useState(0);

    useEffect(() {
      var tt = Timer.periodic(Duration(seconds: 1), (t) {
        counter.value = t.tick;
      });
    }, []);


    Future<String> getName() async {
      await Future.delayed(Duration(seconds: 1));
      return "Hello World ${counter.value}";
    }

    final name = useFuture(useMemoized(getName,[counter.value]));
    return Scaffold(
      body: Center(
        child: Text(
          name.hasData ? name.data! : "The Data Loading",
        ),
      ),
    );
  }
}
