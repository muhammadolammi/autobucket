import 'package:autobucket/api/auth.dart';
import 'package:autobucket/api/firestore.dart';
import 'package:autobucket/core/utils.dart';
import 'package:autobucket/features/auth/views/signInView.dart';
import 'package:autobucket/features/home/view.dart';
import 'package:autobucket/models/user.dart';
import 'package:autobucket/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(
      authApi: ref.watch(authApiProvider),
      firestoreApi: ref.watch(firestoreApiProvider));
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthApi _authApi;
  final FirestoreApi _firestoreApi;
  AuthNotifier({required AuthApi authApi, required FirestoreApi firestoreApi})
      : _authApi = authApi,
        _firestoreApi = firestoreApi,
        super(false);

  void signUp({
    required UserModel user,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.signUp(user);
    res.fold((l) {
      showSnackBar(context: context, content: l.message);
      state = false; // Set state to false in case of failure
    }, (r) async {
      final res2 = await _firestoreApi.saveUserDetails(user);
      res2.fold((l) {
        showSnackBar(context: context, content: l.message);
        state = false; // Set state to false in case of failure
      }, (r) {
        showSnackBar(context: context, content: 'Account Created');
        Navigator.pushNamed(context, SignInView.route);
        state = false; // Set state to false on success
      });
    });
  }

  void signIn({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.signIn(email, password);
    res.fold((l) {
      showSnackBar(context: context, content: l.message);
      state = false; // Set state to false in case of failure
    }, (r) {
      showSnackBar(context: context, content: 'Logged In Successful');
      Navigator.pushNamed(context, HomeView.route);
      state = false; // Set state to false on success
    });
  }
}
