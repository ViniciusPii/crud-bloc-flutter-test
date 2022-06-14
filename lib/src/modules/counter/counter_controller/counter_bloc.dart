import 'dart:async';

import 'counter_state.dart';

class CounterBloc {
  final _counterStreamController = StreamController<CounterState>();
  Stream<CounterState> get counterOut => _counterStreamController.stream;

  int _counter = 0;

  Future<void> increment() async {
    try {
      _counterStreamController.add(CounterStateLoading());
      await Future.delayed(const Duration(seconds: 1));
      // throw Exception();
      _counterStreamController.add(CounterState(counter: ++_counter));
    } on Exception catch (_) {
      _counterStreamController.add(CounterStateError(message: 'Erro ao clicar'));
    }
  }

  void dispose() {
    _counterStreamController.close();
  }
}
