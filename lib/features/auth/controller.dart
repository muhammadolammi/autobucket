// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:autobucket/api/auth.dart';

class authProviderNotifier extends StateNotifier<bool> {
  final AuthApi _authApi;

  authProviderNotifier({required AuthApi authApi})
      : _authApi = authApi,
        super(false);
}
