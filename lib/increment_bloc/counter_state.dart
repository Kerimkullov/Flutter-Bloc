abstract class CounterState {}

class CounterStateValue extends CounterState {
  int count;
  CounterStateValue({required this.count});
}
