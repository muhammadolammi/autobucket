import 'package:autobucket/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:autobucket/core/core.dart';

class AuthApi {
  final FirebaseAuth _auth;

  AuthApi({required FirebaseAuth auth}) : _auth = auth;

  FutureEither<UserCredential?> signUp(UserModel user) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      // save user details to firestore

      print("Sign up successful");

      return Either.right(res);
    } on FirebaseAuthException catch (e, stackTrace) {
      print("Sign up failed: $e");
      return Either.left(
          Failure(e.message ?? 'an unknown error occured', stackTrace));
    } catch (e, stackTrace) {
      print("Sign up failed: $e");
      return Either.left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<UserCredential> signIn(String email, String password) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Either.right(res);
    } on FirebaseAuthException catch (e, stackTrace) {
      print("Sign in failed: $e");
      return Either.left(
          Failure(e.message ?? 'an unkown error occured', stackTrace));
    } catch (e, stackTrace) {
      print("Sign in failed: $e");
      return Either.left(Failure(e.toString(), stackTrace));
    }
  }
}
