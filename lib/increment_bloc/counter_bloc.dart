import 'package:bloc/bloc.dart';
import 'package:practice_bloc/increment_bloc/counter_event.dart';
import 'package:practice_bloc/increment_bloc/counter_state.dart';

class CounterBlock extends Bloc<IncrementEvent, CounterState> {
  CounterBlock() : super(CounterStateValue(count: 0)) {
    on<IncrementEvent>(
      (event, emit) => emit(
        CounterStateValue(count: (state as CounterStateValue).count += 1),
      ),
    );
  }
}