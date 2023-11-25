sealed class SignInState {}

class Init extends SignInState {}

class Loading extends SignInState {}

class Success extends SignInState {}

class Error extends SignInState {
  final String msg;

  Error(this.msg);
}