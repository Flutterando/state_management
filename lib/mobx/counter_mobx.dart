import 'package:flutter_with_bloc/flutter_bloc/counter_flutter_bloc.dart';
import 'package:mobx/mobx.dart';
part 'counter_mobx.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  
  @observable
  int value = 0;

  @action
  void increment(CounterActions action) {
    if (action == CounterActions.INCREMENT) {
      value++;
    } else {
      value--;
    }
  }
}
