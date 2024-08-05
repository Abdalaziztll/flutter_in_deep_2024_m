// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_project/handling_error/handle_auth_message.dart';
import 'package:tdd_project/model/cat_model.dart';
import 'package:tdd_project/model/data_model.dart';
import 'package:tdd_project/model/user_model.dart';
import 'package:tdd_project/repos/auth_repo.dart';
import 'package:tdd_project/service/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class MockRepo extends Mock implements AuthRepo {}

void main() {
  group("test for formMap catmodel ", () {
    test("happy scenrio", () {
      CatModel cat = CatModel.fromMap({
        "id": 1,
        "name": "Persian",
        "origin": "Iran",
        "temperament": "Sweet, Gentle, Quiet",
        "colors": ["White", "Black", "Blue", "Cream"],
        "description":
            "The Persian cat is a long-haired breed known for its luxurious coat and sweet personality. They are calm and affectionate cats that enjoy a relaxed indoor lifestyle.",
        "image": "https://fakeimg.pl/500x500/cc5500"
      });

      expect(cat, isA<CatModel>());
    });

    test("test fromMap with 200 status Code and empty Map", () {
      CatModel cat = CatModel.fromMap({
        "id": null,
        "name": null,
        "origin": null,
        "temperament": "Sweet, Gentle, Quiet",
        "colors": ["White", "Black", "Blue", "Cream"],
        "description":
            "The Persian cat is a long-haired breed known for its luxurious coat and sweet personality. They are calm and affectionate cats that enjoy a relaxed indoor lifestyle.",
        "image": null
      });

      expect(cat, isA<CatModel>());
    });
  });

  group("test userModel toMap", () {
    test("happy scenrio", () {
      UserModel user = UserModel.fromMap({
        "firstName": "string",
        "lastName": "string",
        "phone": "stringstri",
        "username": "string",
        "birthDate": "2024-08-05",
        "password": "string",
        "confirmPassword": "string"
      });

      expect(user.toMap(), {
        "firstName": "string",
        "lastName": "string",
        "phone": "stringstri",
        "username": "string",
        "birthDate": "2024-08-05",
        "password": "string",
        "confirmPassword": "string"
      });
    });

    test("bad scenrio", () {
      UserModel user = UserModel.fromMap({
        "firstName": null,
        "lastName": null,
        "phone": null,
        "username": null,
        "birthDate": null,
        "password": null,
        "confirmPassword": null
      });

      expect(user.toMap(), {
        "firstName": null,
        "lastName": null,
        "phone": null,
        "username": null,
        "birthDate": null,
        "password": null,
        "confirmPassword": null
      });
    });
  });

  group("service test with singup method", () {
    late UserModel user;
    late AuthService authService;
    late Dio dio;

    setUp(() {
      user = UserModel.fromMap({
        "firstName": "helol",
        "lastName": "dsahdasj",
        "phone": "0932132133",
        "username": "helllworld",
        "birthDate": "2022-02-02",
        "password": "sssssssSs1",
        "confirmPassword": "sssssssSs1"
      });
      dio = Dio();
      authService = AuthService(dio);
    });

    test("null value to server side", () async {
      try {
        var data = await authService.signup(user);
      } catch (e) {
        expect(e, isA<PasswordHasNotSpeicalCharcter>());
      }
    });
  });

  group("test auth repo", () {
    late Dio dio;
    late AuthService authService;
    late AuthRepo repo;
    late UserModel user;

    setUp(() {
      user = UserModel.fromMap({
        "firstName": "helol",
        "lastName": "dsahdasj",
        "phone": "0932132133",
        "username": "helllworld",
        "birthDate": "2022-02-02",
        "password": "sssssssSs1",
        "confirmPassword": "sssssssSs1"
      });
      dio = Dio();
      authService = AuthService(dio);
      repo = AuthRepo(authService);
    });
    test("Hadnling repo DataFailed", () async {
      var data = await repo.signUp(user);
      expect(data, isA<DataFailed>());
    });

    test("repo", () {
      MockRepo repo = MockRepo();
      MockAuthService service = MockAuthService();
      when(service.signup(user)).thenThrow(() {
        throw Exception();
      });
    });
  });
}
