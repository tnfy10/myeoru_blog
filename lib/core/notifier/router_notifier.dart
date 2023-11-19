import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/presentation/error/not_found_screen.dart';
import 'package:myeoru_blog/presentation/home/screen/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

@Riverpod(keepAlive: true)
class GoRouterNotifier extends _$GoRouterNotifier {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  late List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (_, __) => const HomeScreen(),
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
