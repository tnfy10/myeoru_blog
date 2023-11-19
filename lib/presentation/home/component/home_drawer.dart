import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/core/notifier/auth_notifier.dart';
import 'package:myeoru_blog/core/route/route_extension.dart';
import 'package:myeoru_blog/domain/model/board_category.dart';
import 'package:myeoru_blog/presentation/auth/screen/sign_in_screen.dart';
import 'package:myeoru_blog/presentation/home/screen/home_screen.dart';

class HomeDrawer extends ConsumerWidget {
  final int selectedIndex;
  final void Function(int index) onChangedSelectedIndex;
  final User? user;
  final AsyncValue<List<BoardCategory>> homeDrawerState;

  const HomeDrawer({
    super.key,
    required this.selectedIndex,
    required this.onChangedSelectedIndex,
    required this.user,
    required this.homeDrawerState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [_drawerHeader(context, ref), ..._drawerMenuItems(context)],
      ),
    );
  }

  Widget _drawerHeader(BuildContext context, WidgetRef ref) {
    if (user == null) {
      return DrawerHeader(
        child: Column(
          children: [
            const Text('로그인 후 더 많은 기능을 이용하실 수 있습니다.'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateSignIn();
              },
              child: const Text('로그인'),
            )
          ],
        ),
      );
    }

    return DrawerHeader(
      child: Column(
        children: [
          ListTile(
            title: Text(user?.displayName ?? ''),
            subtitle: Text(user?.email ?? ''),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            child: const Text('로그아웃'),
          )
        ],
      ),
    );
  }

  List<Widget> _drawerMenuItems(BuildContext context) {
    if (homeDrawerState.isLoading) {
      return [
        Container(
          height: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        )
      ];
    }

    if (homeDrawerState.hasError) {
      return [
        Container(
          height: 100,
          alignment: Alignment.center,
          child: Text(homeDrawerState.error.toString()),
        )
      ];
    }

    final drawerList = homeDrawerState.requireValue;

    return drawerList
        .mapIndexed((index, e) => ListTile(
              title: Text(e.label),
              selected: selectedIndex == index,
              onTap: () {
                onChangedSelectedIndex(index);
                context.pop();
              },
            ))
        .toList();
  }
}
