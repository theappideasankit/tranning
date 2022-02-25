import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/repos.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  final Repository repository;
  final TodosCubit todosCubit;

  AddCubit({
    this.repository,
    this.todosCubit,
  }) : super(AddInitial());

  void addTodo(String message) {
    if (message.isEmpty) {
      emit(AddTodoError(error: "todo message is empty"));
      return;
    }
    emit(AddingTodo());
    Timer(Duration(seconds: 1), () {
      repository.addTodo(message).then((todo) {
        if (todo != null) {
          todosCubit.addTodo(todo);
          emit(AddedTodo());
        }
      });
    });
  }
}
