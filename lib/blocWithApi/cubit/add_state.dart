part of 'add_cubit.dart';

abstract class AddState {}

class AddInitial extends AddState {}

class AddTodoError extends AddState {
  final String error;

  AddTodoError({this.error});
}

class AddingTodo extends AddState {}

class AddedTodo extends AddState {}
