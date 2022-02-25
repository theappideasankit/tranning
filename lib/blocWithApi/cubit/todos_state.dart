part of 'todos_cubit.dart';

class TodosState {}

class TodosInitial extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded({this.todos});
}
