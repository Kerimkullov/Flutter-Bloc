import 'package:bloc/bloc.dart';
import 'package:practice_bloc/increment_bloc/counter_event.dart';
import 'package:practice_bloc/increment_bloc/counter_state.dart';

class CounterBlock extends Bloc<IncrementEvent, CounterState> {
  CounterBlock() : super(IncrementState(count: 0)) {
    on<IncrementEvent>(
      (event, emit) => emit(
        IncrementState(count: (state as IncrementState).count += 1),
      ),
    );
  }
}
