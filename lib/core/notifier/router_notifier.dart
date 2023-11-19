import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/core/firebase/firebase_module.dart';
import 'package:myeoru_blog/core/notifier/auth_notifier.dart';
import 'package:myeoru_blog/core/route/routes.dart';
import 'package:myeoru_blog/core/utils/logger.dart';
import 'package:myeoru_blog/presentation/error/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

@Riverpod(keepAlive: true)
class GoRouterNotifier extends _$GoRouterNotifier {
  @override
  GoRouter build() {
    final analytics = ref.read(firebaseAnalyticsProvider);

    return GoRouter(
      routes: routes,
      errorBuilder: ((_, __) => const NotFoundScreen()),
      initialLocation: '/',
      redirect: redirectLogic,
      refreshListenable: ref.watch(authNotifierProvider.notifier),
      observers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }

  String? redirectLogic(BuildContext context, GoRouterState goRouterState) {
    final user = ref.read(authNotifierProvider);

    if (user != null && goRouterState.fullPath?.startsWith('/signIn') == true) {
      return '/';
    }

    return null;
  }
}
