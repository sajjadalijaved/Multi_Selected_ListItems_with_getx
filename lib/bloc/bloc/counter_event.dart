part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncreamentEvent extends CounterEvent{}

class CounterDecrementEvent extends CounterEvent{}