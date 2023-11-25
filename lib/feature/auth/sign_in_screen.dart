import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myeoru_blog/feature/auth/sign_in_notifier.dart';
import 'package:myeoru_blog/feature/auth/sign_in_state.dart';
import 'package:myeoru_blog/feature/home/screen/home_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static String get routeName => 'signIn';

  final String continuePath;

  const SignInScreen({
    super.key,
    required this.continuePath,
  });

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInNotifierProvider);

    if (signInState is Success) {
      context.go(widget.continuePath);
    }

    return IgnorePointer(
      ignoring: signInState is Loading,
      child: Stack(
        children: [
          Scaffold(
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
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('비밀번호'),
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) {
                        _signIn();
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        signInState is Error ? signInState.msg : '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _signIn,
                        child: const Text('로그인'))
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: signInState is Loading,
            child: Container(
              color: Colors.black26,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  void _signIn() {
    final email = emailController.text;
    final password = passwordController.text;
    ref.read(signInNotifierProvider.notifier).signIn(email, password);
  }
}
