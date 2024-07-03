import 'package:animate_flutter_flow/view/explicit_animation.dart';
import 'package:animate_flutter_flow/view/flow_widget.dart';
import 'package:animate_flutter_flow/view/implicit_animation.dart';
import 'package:animate_flutter_flow/view/mix_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowWidgetPage(),
    );
  }
}
