import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  double width = 100;
  double height = 100;
  Color color = Colors.red;
  double padding_and_margin = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StatefulBuilder(builder: (context, setstate) {
          return InkWell(
            onTap: () {
              setstate(() {
                width = width + 20;
                height = height + 20;
                padding_and_margin = padding_and_margin + 5;
                color = Colors.blue;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: width,
              height: height,
              color: color,
              margin: EdgeInsets.all(padding_and_margin),
              padding: EdgeInsets.all(padding_and_margin),
              child: Text("Hello"),
            ),
          );
        }),
      ),
    );
  }
}

class SimpleTweenExample extends StatelessWidget {
  SimpleTweenExample({super.key});

  final Tween<double> animation = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: animation,
          duration: Duration(milliseconds: 200),
          builder: (context, value, child) {
            print(value);
            return Opacity(
              opacity: value,
              child: Container(
                child: Opacity(
                    opacity: value,
                    child: Text(
                      "Hello Wolrd",
                      style: TextStyle(fontSize: value * 20),
                    )),
                margin: EdgeInsets.all(value * 30),
                color: Colors.red,
                width: 200 * value,
                height: 200 * value,
              ),
            );
          },
        ),
      ),
    );
  }
}
