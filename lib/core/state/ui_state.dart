sealed class UiState {}

class Loading extends UiState {}

class Success <T> extends UiState {
  final T data;

  Success({required this.data});
}

class Error extends UiState {
  final String msg;
  final Object? error;

  Error(this.msg, {this.error});
}