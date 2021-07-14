import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_todo_state.freezed.dart';

@freezed
class CreateTodoState with _$CreateTodoState {
  factory CreateTodoState.form(
      {@Default("") String title, @Default("") String body}) = Form;
  factory CreateTodoState.loading() = Loading;
  factory CreateTodoState.success() = Success;
  factory CreateTodoState.error() = Error;
}
