import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/core/utils/logger.dart';
import 'package:myeoru_blog/feature/auth/screen/sign_in_screen.dart';

extension Navigation on BuildContext {
  void navigateSignIn() {
    final GoRouterState state = GoRouterState.of(this);
    final query = state.uri.query;
    var continuePath = state.fullPath;

    if (continuePath == null) {
      goNamed(SignInScreen.routeName, queryParameters: {'continue': ''});
      return;
    }

    if (query.isNotEmpty) {
      continuePath += '?$query';
    }

    logger.d('[navigateSignIn] continue=$continuePath');

    goNamed(SignInScreen.routeName, queryParameters: {'continue': continuePath});
  }
}
