import 'package:day1/blocWithApi/constantsss/str.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:day1/blocWithApi/data/network_service.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:day1/blocWithApi/presentation/screenz/add_todo.dart';
import 'package:day1/blocWithApi/presentation/screenz/edit_todo.dart';
import 'package:day1/blocWithApi/presentation/screenz/popular-list.dart';
import 'package:day1/blocWithApi/presentation/screenz/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
/*
  Repository repository;
  TodosCubit todosCubit;

  AppRouter() {
    repository = Repository(networkServices: NetworkServices());
    todosCubit = TodosCubit(repository: repository);
  }
*/

  Route omGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BLOC_WITH_API:
        return MaterialPageRoute(builder: (_) => const TodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) =>  AddTodo());
        case POPS_LIST_ROUTE:
        return MaterialPageRoute(builder: (_) =>  PopularListFood());
      case EDIT_TODO_ROUTE:
        final todo = settings.arguments as Todo;
        return MaterialPageRoute(builder: (_) =>  EditTodo(todo: todo));
      default:
        return null;
    }
  }
}
