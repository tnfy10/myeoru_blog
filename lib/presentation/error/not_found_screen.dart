import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/presentation/home/screen/home_screen.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            const Text('해당 페이지를 찾을 수 없습니다.'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.goNamed(HomeScreen.routeName);
                }
              },
              child: const Text('이전 페이지로 돌아가기'),
            )
          ],
        ),
      ),
    );
  }
}
