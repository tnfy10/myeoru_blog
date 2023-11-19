import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeoru_blog/core/notifier/auth_notifier.dart';
import 'package:myeoru_blog/presentation/home/component/home_drawer.dart';
import 'package:myeoru_blog/presentation/home/notifier/home_drawer_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedDrawerMenuIdx = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider);
    final homeDrawerState = ref.watch(homeDrawerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Myeoru Blog'),
      ),
      drawer: HomeDrawer(
        selectedIndex: selectedDrawerMenuIdx,
        onChangedSelectedIndex: (index) {
          setState(() {
            selectedDrawerMenuIdx = index;
          });
        },
        homeDrawerState: homeDrawerState,
        user: user,
      ),
    );
  }
}
