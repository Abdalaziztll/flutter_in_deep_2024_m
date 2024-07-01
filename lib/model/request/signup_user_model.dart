// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupUserModel {
  String firstName;
  String lastName;
  String email;
  String role;
  String password;
  SignupUserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.password,
  });

  SignupUserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? password,
  }) {
    return SignupUserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      role: role ?? this.role,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'password': password,
    };
  }

  factory SignupUserModel.fromMap(Map<String, dynamic> map) {
    return SignupUserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupUserModel.fromJson(String source) => SignupUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupUserModel(firstName: $firstName, lastName: $lastName, email: $email, role: $role, password: $password)';
  }

  @override
  bool operator ==(covariant SignupUserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.role == role &&
      other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      role.hashCode ^
      password.hashCode;
  }
}
