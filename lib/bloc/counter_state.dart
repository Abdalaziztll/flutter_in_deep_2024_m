part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class IncreamentCounter extends CounterState {}

class LoadingCounter extends CounterState {}

class IncreamentNew extends CounterState {}