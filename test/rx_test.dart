import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_bloc/flutter_bloc/counter_flutter_bloc.dart';
import 'package:flutter_with_bloc/mobx/counter_mobx.dart';
import 'package:flutter_with_bloc/rx/counter_bloc.dart';

void main() {
  final rxBloc = CounterBloc();
  final flutterBloc = CounterFlutterBloc();
  final counterMobx = Counter();

  group("test with state management", () {
    test("test with mobx", () {
      expect(counterMobx.value, 0);

      counterMobx.increment(CounterActions.INCREMENT);
      expect(counterMobx.value, 1);

      counterMobx.increment(CounterActions.DECREMENT);
      expect(counterMobx.value, 0);
    });

    test("test bloc with rx", () {
      expect(rxBloc.counter, emitsInOrder([0, 1, 0]));

      rxBloc.counterEvent(CounterActions.INCREMENT);

      rxBloc.counterEvent(CounterActions.DECREMENT);
    });

    test("test flutter_bloc", () {
      expect(flutterBloc, emitsInOrder([0, 1, 0]));

      flutterBloc.add(CounterActions.INCREMENT);

      flutterBloc.add(CounterActions.DECREMENT);
    });
  });
}
