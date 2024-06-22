import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int coutner = 0;

  addToCoutner() {
    coutner++;
    notifyListeners();
  }

  
}
