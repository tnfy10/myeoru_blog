import 'package:myeoru_blog/core/auth/auth_notifier.dart';
import 'package:myeoru_blog/feature/auth/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_notifier.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  late final _authNotifier = ref.read(authNotifierProvider.notifier);

  @override
  SignInState build() => Init();

  void signIn(String email, String password) {
    if (email.isEmpty) {
      state = Error('이메일을 입력해주세요.');
      return;
    }

    if (password.isEmpty) {
      state = Error('비밀번호를 입력해주세요.');
      return;
    }

    state = Loading();
    _authNotifier.signIn(email: email, password: password).then((_) {
      state = Success();
    }, onError: (e) {
      state = Error(e.toString());
    });
  }
}
