import 'package:autobucket/api/auth.dart';
import 'package:autobucket/api/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final firestore = Provider((ref) {
  return FirebaseFirestore.instance;
});

final authApiProvider = Provider((ref) {
  return AuthApi(auth: ref.watch(firebaseAuthProvider));
});

final firestoreApiProvider = Provider((ref) {
  return FirestoreApi(firestore: ref.watch(firestore));
});
