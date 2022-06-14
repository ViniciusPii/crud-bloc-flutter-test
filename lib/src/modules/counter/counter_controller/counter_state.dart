class CounterState {
  CounterState({
    required this.counter,
  });

  final int counter;
}

class CounterStateLoading extends CounterState {
  CounterStateLoading() : super(counter: 0);
}

class CounterStateError extends CounterState {
  CounterStateError({
    required this.message,
  }) : super(counter: 0);

  final String message;
}
