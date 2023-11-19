import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/presentation/home/screen/home_screen.dart';

final List<GoRoute> routes = [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (_, __) => const HomeScreen(),
  ),
];
