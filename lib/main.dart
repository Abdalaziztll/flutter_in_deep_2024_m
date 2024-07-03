import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flow(
        delegate: MyDelegate(animation: controller),
        children: [
          Icon(Icons.abc),
          Icon(Icons.face),
          Icon(Icons.facebook),
          Icon(Icons.insert_page_break),
          Icon(Icons.email),
          Icon(Icons.one_x_mobiledata),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (controller.isCompleted) {
          controller.reverse();
        } else {
          controller.forward();
        }
      }),
    );
  }
}

class MyDelegate extends FlowDelegate {
  final Animation<double> animation;

  MyDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      double size = context.getChildSize(i)!.height * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              size * animation.value, size * animation.value, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
