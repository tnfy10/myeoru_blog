import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/feature/auth/sign_in_screen.dart';
import 'package:myeoru_blog/feature/home/screen/home_screen.dart';

final List<GoRoute> routes = [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (_, __) => const HomeScreen(),
  ),
  GoRoute(
    path: '/signIn',
    name: SignInScreen.routeName,
    builder: (_, state) => SignInScreen(
      continuePath: state.uri.queryParameters['continue'] ?? '/',
    ),
  ),
];
