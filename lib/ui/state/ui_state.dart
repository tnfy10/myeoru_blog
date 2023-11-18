sealed class UiState<T extends Object> {}

class Loading<T extends Object> implements UiState<T> {}

class Success<T extends Object> implements UiState<T> {
  final T data;

  Success({
    required this.data,
  });
}

class Error<T extends Object> implements UiState<T> {
  final String message;
  final Exception? e;

  Error({
    required this.message,
    required this.e,
  });
}
