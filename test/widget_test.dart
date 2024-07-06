// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mock_and_arch/main.dart';
import 'package:mock_and_arch/model/handling.dart';
import 'package:mock_and_arch/model/user_model.dart';
import 'package:mock_and_arch/service/mock/mock_auth_service.dart';
import 'package:mockito/mockito.dart';

void main() {
  final mock = MockAuthService();
  test("Serivce Layer With UserModel Not Empyu", () {
    // mock.logIn(UserModel(username: "username", password: "password")).then(onValue)
  });
}
