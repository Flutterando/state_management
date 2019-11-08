import 'package:flutter_with_bloc/flutter_bloc/counter_flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
/*
class CounterBloc {
  final _counter$ = PublishSubject();
  Observable<int> counter;

  CounterBloc() {
    counter = _counter$.scan((acc, curr, i) => acc + curr, 0);
  }

  void counterEvent(int counter) => _counter$.add(counter);
}
*/

class CounterBloc {
  final _counter$ = PublishSubject<CounterActions>();
  Observable<int> counter;

  CounterBloc() {
    counter = _counter$.startWith(CounterActions.EMPTY).scan((acc, curr, i) {
      if (curr == CounterActions.INCREMENT) {
        return acc + 1;
      } else if (curr == CounterActions.DECREMENT) {
        return acc - 1;
      }
      return 0;
    }, 0);
  }

  void counterEvent(CounterActions action) => _counter$.add(action);
}
