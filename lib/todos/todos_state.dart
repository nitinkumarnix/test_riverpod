import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_riverpod/todos/todo_model.dart';

part 'todos_state.freezed.dart';
part 'todos_state.g.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState.initial() = Initial;
  const factory TodosState.loading() = Loading;
  const factory TodosState.loaded({@Default([]) List<Todo> data}) = Loaded;
  const factory TodosState.error(String error) = Error;

  factory TodosState.fromJson(Map<String, dynamic> json) => _$TodosStateFromJson(json);
}