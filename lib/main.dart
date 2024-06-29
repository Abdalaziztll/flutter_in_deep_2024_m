import 'package:arch_and_getx/view/counter_example.dart';
import 'package:arch_and_getx/view/dog_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DogPage(),
    );
  }
}


