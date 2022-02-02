abstract class IncrementEvent {
  @override
  String toString() {
    return 'IncrementEvent';
  }
}

class IncrementValue extends IncrementEvent {
  @override
  String toString() {
    return 'IncrementValue';
  }
}
