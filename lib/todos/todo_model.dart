import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class Todo with _$Todo {
    const factory Todo({
        required int userId,
        required int id,
        required String title,
        required bool completed,
    }) = _Todo;

    factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
