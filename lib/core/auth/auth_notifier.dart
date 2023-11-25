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
      if (user == null) {
        logger.i('User is currently signed out!');
      } else {
        logger.i('User is signed in!');
      }
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
      throw Exception('잘못된 이메일 또는 비밀번호를 입력하셨습니다.\n확인 후 다시 시도해주세요.');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
