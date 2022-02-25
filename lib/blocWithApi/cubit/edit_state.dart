part of 'edit_cubit.dart';

@immutable
abstract class EditState {}

class EditInitial extends EditState {}

class EditTodoError extends EditState {
  final String error;

  EditTodoError({this.error});
}

class EditedTodo extends EditState {
  final List<Todo> todos;

  EditedTodo({this.todos});
}
