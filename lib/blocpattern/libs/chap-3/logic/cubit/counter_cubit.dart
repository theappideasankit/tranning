
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(wasIncremented: true, counterValue: state.counterValue + 1));

      void decrement() => emit(
      CounterState(wasIncremented: false, counterValue: state.counterValue - 1));


}
