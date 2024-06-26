import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;
    on<Add>((event, emit) async {
      emit(LoadingCounter());
      await Future.delayed(Duration(seconds: 2));
      counter++;
      print("object");
      print(counter);
      if (counter > 1) {
        emit(IncreamentNew());
      } else {
        emit(IncreamentCounter());
      }
    });
  }
}
