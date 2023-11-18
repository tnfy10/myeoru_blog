import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/ui/error/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ui/main/screen/main_screen.dart';

part 'router_notifier.g.dart';

@Riverpod(keepAlive: true)
class GoRouterNotifier extends _$GoRouterNotifier {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  late List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: MainScreen.routeName,
      builder: (_, __) => const MainScreen(),
    ),
  ];

  @override
  GoRouter build() => GoRouter(
      routes: routes,
      errorBuilder: ((_, __) => const NotFoundScreen()),
      initialLocation: '/',
      redirect: redirectLogic,
      observers: [FirebaseAnalyticsObserver(analytics: analytics)]);

  String? redirectLogic(BuildContext context, GoRouterState goRouterState) {
    return null;
  }
}
