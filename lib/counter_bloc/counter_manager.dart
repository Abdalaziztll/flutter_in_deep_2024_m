import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/counter_bloc/counter_event.dart';
import 'package:intro_to_bloc/counter_bloc/counter_state.dart';

class CounterManager extends Bloc<CounterEvent, CounterState> {
  CounterManager() : super(LoadingState()) {
    int counter = 0;
    on<Increament>(
      (event, emit) {
        if (counter >= 10) {
          emit(LoadingState());
        } else {
          counter++;
          emit(AddToTheCounter(counter: counter));
        }
      },
    );

    on<Decreamnet>(
      (event, emit) {
        if (counter <= 0) {
          emit(TheCounterIsNegative());
        } else {
          counter--;
          emit(SubTheCounter(counter: counter));
        }
      },
    );

    on<RestoreToZero>((event, emit) {
      emit(LoadingState());
      counter = 0;
    });
  }
}
