import 'package:day1/blocWithApi/constantsss/str.dart';
import 'package:day1/blocWithApi/cubit/todos_cubit.dart';
import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: "Todos".text.make(),
        actions: [
          GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, ADD_TODO_ROUTE),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is! TodosLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = (state as TodosLoaded).todos;
          return SingleChildScrollView(
            child: Column(
              children: todos.map((e) => _todo(e, context)).toList(),
            ).py(15),
          );
        },
      ),
    );
  }

  Widget _todo(Todo todo, context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, EDIT_TODO_ROUTE, arguments: todo),
      child: Dismissible(
        confirmDismiss: (_) async {
          BlocProvider.of<TodosCubit>(context).changeCompletion(todo);
          return false;
        },
        background: Container(
          color: const Color(0xd31a1a1a),
        ),
        key: Key("${todo.id}"),
        child: _todoTileWidget(todo, context),
      ),
    ).py(4);
  }

  Widget _todoTileWidget(Todo todo, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0xd31a1a1a), blurRadius: 10, spreadRadius: 10)
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          todo.todoMessage.text.black.make(),
          _completionIndicator(todo)
        ],
      ),
    );
  }

  Widget _completionIndicator(Todo todo) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          width: 6.0,
          color: todo.isCompleted ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
