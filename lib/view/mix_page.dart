import 'package:animate_flutter_flow/config/theme/mix_style.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PressableBox(
          child:Text("Hello") ,
          style: style,
        ),
      ),
    );
  }
}
