part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}


class Add extends CounterEvent {}