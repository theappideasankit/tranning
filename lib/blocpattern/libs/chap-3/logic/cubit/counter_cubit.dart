import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(wasIncremented: true, counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(
      wasIncremented: false, counterValue: state.counterValue - 1));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    addError(Exception("Could't write to storage!"), StackTrace.current);
    return state.toMap();
  }

}
