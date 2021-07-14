import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'counter_notifier.freezed.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  incrementCounter() {
    state++;
  }
}


final counterWithStateProvider = StateNotifierProvider<CounterNotiferWithCustomState, CounterState>((ref) => CounterNotiferWithCustomState());

class CounterNotiferWithCustomState extends StateNotifier<CounterState> {
  CounterNotiferWithCustomState() : super(CounterState());

  incrementCounter() {
    state = state.copyWith(value: state.value + 1);
  }
}

@freezed
class CounterState with _$CounterState {
  factory CounterState({@Default(0) int value}) = _CounterState;
}
