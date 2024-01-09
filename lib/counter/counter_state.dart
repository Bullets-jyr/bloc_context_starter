part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
