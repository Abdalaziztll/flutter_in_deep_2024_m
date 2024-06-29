import 'package:arch_and_getx/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final controller = Get.put(CounterController());

  final controllerWitRx = Get.put(CounterContollerWithRxDart());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
              builder: (context) {
                return Text(controller.counter.toString());
              },
            ),
            Obx(() {
              return Text(controllerWitRx.counter.toString());
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increament();
          controllerWitRx.subToCounter();
        },
      ),
    );
  }
}
