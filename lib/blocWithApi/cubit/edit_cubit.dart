import 'package:bloc/bloc.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:meta/meta.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final Repository repository;
  final TodosCubit todosCubit;

  EditCubit({this.repository, this.todosCubit}) : super(EditInitial());

  void deleteTodo(Todo todo) {
    repository.deleteTodo(todo.id).then((isDeleted) {
      if (isDeleted) {
        todosCubit.deleteTodo(todo);
        emit(EditedTodo());
      }
    });
  }

  void updateTodo(Todo todo, String message) {
    if (message.isEmpty) {
      emit(EditTodoError(error: "message is empty "));
      return;
    }
    repository.updateTodo(todo.id, message).then((isUpdated) {
      if (isUpdated) {
        todo.todoMessage = message;
        todosCubit.updateTodoList();
        emit(EditedTodo());
      }
    });
  }
}
