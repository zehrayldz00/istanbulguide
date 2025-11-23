import 'dart:convert';

import 'package:istanbulguidetwo/domain/auth/entity/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel{
  UserEntity toEntity() {
    return UserEntity(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email
    );
  }
}