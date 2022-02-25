import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:day1/blocWithApi/data/repos.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository repository;

  TodosCubit({this.repository}) : super(TodosState());

  void fetchTodos() {
    Timer(const Duration(seconds: 0), () {
      repository.fetchTodos().then((todos) {
        emit(TodosLoaded(todos: todos));
      });
    });
  }

  void changeCompletion(Todo todo) {
    repository.changeCompletion(!todo.isCompleted, todo.id).then((isChanged) {
      if (isChanged) {
        todo.isCompleted = !todo.isCompleted;
        updateTodoList();
      }
    });
  }

  void updateTodoList() {
    final currentState = state;
    if (currentState is TodosLoaded) {
      emit(TodosLoaded(todos: currentState.todos));
    }
  }

  void addTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final todoList = currentState.todos;
      todoList.add(todo);
      emit(TodosLoaded(todos: todoList));
    }
  }

  void deleteTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final todoList =
          currentState.todos.where((element) => element.id != todo.id).toList();
      todoList.remove(todo);
      emit(TodosLoaded(todos: todoList));
    }
  }
}
