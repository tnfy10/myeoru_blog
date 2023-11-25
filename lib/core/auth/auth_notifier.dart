import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:myeoru_blog/core/firebase/firebase_module.dart';
import 'package:myeoru_blog/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier with ChangeNotifier {
  late final auth = ref.read(firebaseAuthProvider);
  StreamSubscription? streamSubscription;

  @override
  User? build() {
    streamSubscription ??= auth.authStateChanges().listen((User? user) {
      _changeAuthState(user);
    });

    ref.onDispose(() {
      streamSubscription?.cancel();
      streamSubscription = null;
    });

    return null;
  }

  void _changeAuthState(User? user) {
    state = user;
    notifyListeners();
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      logger.e(e.message.toString());
      throw '잘못된 이메일 또는 비밀번호 입니다.';
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
