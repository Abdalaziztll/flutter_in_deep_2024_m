import 'package:flutter/material.dart';

class FlowWidgetPage extends StatefulWidget {
  const FlowWidgetPage({super.key});

  @override
  State<FlowWidgetPage> createState() => _FlowWidgetPageState();
}


class _FlowWidgetPageState extends State<FlowWidgetPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flow(
        delegate: MyDelegate(animation: controller),
        children: [
          Icon(Icons.face),
          Icon(Icons.facebook),
          Icon(Icons.email),
          Icon(Icons.help_outline),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
}

class MyDelegate extends FlowDelegate {
  final Animation animation;

  MyDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      double size = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          size *animation.value,
          size * animation.value,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
