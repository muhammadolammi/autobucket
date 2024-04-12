import 'package:autobucket/core/core.dart';
import 'package:autobucket/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

class FirestoreApi {
  final FirebaseFirestore _firestore;

  FirestoreApi({required FirebaseFirestore firestore}) : _firestore = firestore;

  FutureEitherVoid saveUserDetails(UserModel user) async {
    try {
      await _firestore.collection("users").add({
        "name": user.name,
        "email": user.email,
        "gender": user.gender,
        "isAdmin": user.isAdmin,
        "isWorker": user.isWorker,
        "profilePic": user.profilePic
      });
      return Either.right(null);
    } on FirebaseException catch (e, stackTrace) {
      print("error saving user details: $e");
      return Either.left(
          Failure(e.message ?? 'an unknown error occured', stackTrace));
    } catch (e, stackTrace) {
      print("error saving user details: $e");
      return Either.left(Failure(e.toString(), stackTrace));
    }
  }
}
