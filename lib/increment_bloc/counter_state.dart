abstract class CounterState {}

class IncrementState extends CounterState {
  int count;
  IncrementState({required this.count});
}
