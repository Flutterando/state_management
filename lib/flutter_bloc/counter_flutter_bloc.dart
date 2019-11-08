import 'package:bloc/bloc.dart';

enum CounterActions {EMPTY , INCREMENT , DECREMENT }

class CounterFlutterBloc extends Bloc<CounterActions, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterActions event) async* {
    switch (event) {
      case CounterActions.INCREMENT:
        yield state + 1;
        break;
      case CounterActions.DECREMENT:
        yield state - 1;
        break;
      default:
    }
  }
}
