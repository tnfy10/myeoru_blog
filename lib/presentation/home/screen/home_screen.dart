import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/presentation/home/notifier/main_drawer_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => 'main';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<HomeScreen> {
  int selectedDrawerMenuIdx = 0;

  changeSelectedDrawerMenuIdx(int index) {
    setState(() {
      selectedDrawerMenuIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myeoru Blog'),
      ),
      drawer: Drawer(
        child: drawerMenu(),
      ),
    );
  }

  Widget drawerMenu() {
    final drawerListState = ref.watch(mainDrawerNotifierProvider);

    if (drawerListState.isLoading) {
      return Container(
        padding: const EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: const CircularProgressIndicator(),
      );
    }

    if (drawerListState.hasError) {
      return Container(
        padding: const EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Text(drawerListState.error.toString()),
      );
    }

    final drawerList = drawerListState.requireValue;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(child: Text('Profile')),
        ...drawerList.mapIndexed((index, e) => ListTile(
              title: Text(e.label),
              selected: selectedDrawerMenuIdx == index,
              onTap: () {
                changeSelectedDrawerMenuIdx(index);
                context.pop();
              },
            )),
      ],
    );
  }
}
