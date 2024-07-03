import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

AnimatedStyle style = AnimatedStyle(
  Style(
    $box.height(50),
    $box.width(50),
    $box.color(Colors.blue),
    $box.borderRadius(10),
    $on.hover(
      $box.height(100),
      $box.width(100),
      $box.color.brighten(30),
    ),
    $on.press(
      $box.color(Colors.yellow),
    ),
  ),
  duration: Durations.long1,
  curve: Curves.decelerate,
);
