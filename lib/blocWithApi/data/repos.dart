import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:day1/blocWithApi/data/network_service.dart';

import 'modalz/PopularModel.dart';
import 'modalz/catModel.dart';

class Repository {
  final NetworkServices networkServices;

  Repository({this.networkServices});

  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await networkServices.fetchTodos();
    return todosRaw.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};
    return await networkServices.patchTodo(patchObj, id);
  }

  Future<Todo> addTodo(String message) async {
    final todoObj = {"todo": message, "isCompleted": "false"};
    final todoMap = await networkServices.addTodo(todoObj);
    if (todoMap == null) return null;
    return Todo.fromJson(todoMap);
  }

  Future<bool> deleteTodo(int id) async {
    return await networkServices.deleteTodo(id);
  }

  Future<bool> updateTodo(int id, String message) async {
    final patchObj = {"todo": message};
    return await networkServices.patchTodo(patchObj, id);
  }

  Future<List<PopularElement>> fetchList() async {
    final popularRaw = await networkServices.fetchPopularList();
    return popularRaw.map((e) => PopularElement.fromJson(e)).toList();
  }

  Future<List<CategoryElement>> fetchCategory() async {
    final catRaw = await networkServices.fetchCategoryList();
    return catRaw.map((e) => CategoryElement.fromJson(e)).toList();
  }
}
