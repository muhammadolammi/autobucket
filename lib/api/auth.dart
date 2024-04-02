import 'package:autobucket/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthApi {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthApi({required FirebaseFirestore firestore, required FirebaseAuth auth})
      : _firestore = firestore,
        _auth = auth;

  FutureEither<UserModel> signUp(UserModel user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      // save user details to firestore
      _firestore.collection("users").add({
        "name": user.name,
        "email": user.email,
        "gender": user.gender,
        "isAdmin": user.isAdmin,
        "isWorker": user.isWorker,
        "profilePic": user.profilePic
      });
      print("Sign up successful");

      return user;
    } catch (e) {
      //TODO implement catching error
      print("Sign up failed: $e");
    }
  }

  void signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Sign ins failed: $e");
    }
  }
}
