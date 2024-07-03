import 'package:animate_flutter_flow/view/implicit_animation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation color;
  // late Animation size;
  late Animation size_with_pulse;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    // size = Tween<double>(begin: 30, end: 50).animate(controller);
    size_with_pulse = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 30, end: 60), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 60, end: 50), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 50, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 60, end: 30), weight: 10),
    ]).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return ListTile(
                title: Text("Hello World"),
                subtitle: Text("Irure consequat qui Lorem cillum."),
                trailing: IconButton(
                  onPressed: () {
                    if (controller.isCompleted) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: color.value,
                    size: size_with_pulse.value,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ExplicitAnimationWithListView extends StatefulWidget {
  const ExplicitAnimationWithListView({super.key});

  @override
  State<ExplicitAnimationWithListView> createState() =>
      _ExplicitAnimationWithListViewState();
}

class _ExplicitAnimationWithListViewState
    extends State<ExplicitAnimationWithListView> {
  List<String> names = ["Noor", "Yamen", "Mostafa", "Badr"];
  GlobalKey<AnimatedListState> key = GlobalKey();
  List<Widget> items = [];

  addToListWidget(String name) {
    items.add(
      ListTile(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child:  ExplicitAnimationPage(),
              ));
        },
        title: Text(name),
      ),
    );
  }

  Future future = Future(() {});

  buildAllItems(List<String> allName) {
    for (var i = 0; i < allName.length; i++) {
      future = future.then(
        (value) async {
          await Future.delayed(
              Duration(
                milliseconds: 300,
              ), () {
            addToListWidget(allName[i]);
            key.currentState!.insertItem(i);
          });
        },
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buildAllItems(names);
    });
    super.initState();
  }

  Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: key,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(offset),
            child: items[index],
          );
        },
      ),
    );
  }
}
