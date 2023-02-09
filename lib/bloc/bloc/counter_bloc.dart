// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncreamentEvent>((event, emit) {
     emit.call(CounterState(counterValue: state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      if (state.counterValue > 0) {
        emit.call(CounterState(counterValue: state.counterValue - 1));
      }

    });
  }
}
