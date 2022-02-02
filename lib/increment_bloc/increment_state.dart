abstract class IncrementState {
  @override
  String toString() {
    return 'IncrementState';
  }
}

class IncrementStateValue extends IncrementState {
  int count;
  IncrementStateValue({required this.count});
}
