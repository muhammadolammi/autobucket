// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final bool isWorker;
  final bool isAdmin;
  final String profilePic;
  final String gender;
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.isWorker,
    required this.isAdmin,
    required this.profilePic,
    required this.gender,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    bool? isWorker,
    bool? isAdmin,
    String? profilePic,
    String? gender,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isWorker: isWorker ?? this.isWorker,
      isAdmin: isAdmin ?? this.isAdmin,
      profilePic: profilePic ?? this.profilePic,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'isWorker': isWorker,
      'isAdmin': isAdmin,
      'profilePic': profilePic,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      isWorker: map['isWorker'] as bool,
      isAdmin: map['isAdmin'] as bool,
      profilePic: map['profilePic'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, isWorker: $isWorker, isAdmin: $isAdmin, profilePic: $profilePic, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.isWorker == isWorker &&
        other.isAdmin == isAdmin &&
        other.profilePic == profilePic &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        isWorker.hashCode ^
        isAdmin.hashCode ^
        profilePic.hashCode ^
        gender.hashCode;
  }
}
