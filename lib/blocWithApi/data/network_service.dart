import 'dart:convert';
import 'package:http/http.dart';
import 'modalz/pops.dart';

class NetworkServices {
  final baseUrl = "http://10.0.2.2:3000/";

  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + "todos"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse(baseUrl + "todos/$id"), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map> addTodo(Map<String, String> todoObj) async {
    try {
      final response = await post(Uri.parse(baseUrl + "todos"), body: todoObj);
      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      delete(Uri.parse(baseUrl + "todos/$id"));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<dynamic>> fetchPopularList() async {
    try {
      final response = await get(Uri.parse(baseUrl + "popular"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> fetchCategoryList() async {
    try {
      final response = await get(Uri.parse(baseUrl + "category"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Pops> getPops() async {
    Pops viewModel;
    try {
      var response = await get(Uri.parse(baseUrl + "data"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        print(" View Pops response ===>" + jsonMap.toString());
        viewModel = Pops.fromJson(jsonMap);
      }
      return viewModel;
    } catch (e) {
      return viewModel;
    }
    return viewModel;
  }
}
