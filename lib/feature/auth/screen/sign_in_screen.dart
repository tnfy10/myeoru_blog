import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/core/auth/auth_notifier.dart';
import 'package:myeoru_blog/feature/home/screen/home_screen.dart';

class SignInScreen extends ConsumerWidget {
  static String get routeName => 'signIn';

  final String continuePath;

  const SignInScreen({
    super.key,
    required this.continuePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            context.goNamed(HomeScreen.routeName);
          },
          child: const Text('Myeoru Blog'),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '로그인',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('이메일'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  label: Text('비밀번호'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    ref
                        .read(authNotifierProvider.notifier)
                        .signIn(email: email, password: password)
                        .then((_) {
                      context.go(continuePath);
                    }, onError: (e) {
                      showDialog(
                          context: context,
                          builder: (dlgContext) {
                            return AlertDialog(
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    dlgContext.pop();
                                  },
                                  child: const Text('확인'),
                                )
                              ],
                            );
                          });
                    });
                  },
                  child: const Text('로그인'))
            ],
          ),
        ),
      ),
    );
  }
}
