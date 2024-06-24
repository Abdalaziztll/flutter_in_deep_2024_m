// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterState {}

class LoadingState extends CounterState {}

class AddToTheCounter extends CounterState {
  int counter;
  AddToTheCounter({
    required this.counter,
  });
}

class SubTheCounter extends CounterState {
  int counter;
  SubTheCounter({
    required this.counter,
  });
}

class TheCounterIsNegative extends CounterState {}