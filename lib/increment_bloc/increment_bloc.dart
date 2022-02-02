import 'package:bloc/bloc.dart';
import 'package:practice_bloc/increment_bloc/increment_event.dart';
import 'package:practice_bloc/increment_bloc/increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementStateValue(count: 0)) {
    on<IncrementValue>((event, emit) => _addValue(1, emit));
  }

  void _addValue(int addVal, Emitter<IncrementState> emit) {
    if (state is IncrementStateValue) {
      emit(IncrementStateValue(
          count: (state as IncrementStateValue).count + addVal));
    }
  }
}
