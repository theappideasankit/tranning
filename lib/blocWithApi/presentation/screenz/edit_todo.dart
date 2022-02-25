import 'package:day1/blocWithApi/constantsss/str.dart';
import 'package:day1/blocWithApi/cubit/edit_cubit.dart';
import 'package:day1/blocWithApi/data/modalz/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../customButton.dart';

class EditTodo extends StatelessWidget {
  final Todo todo;

  EditTodo({Key key, this.todo}) : super(key: key);
  final TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    editController.text = todo.todoMessage;
    return BlocConsumer<EditCubit, EditState>(
      listener: (context, state) {
        if (state is EditedTodo) {
          Navigator.pop(context);
        } else if (state is EditTodoError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: state.error.text.make(),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: "Edit Todos".text.make(),
            actions: [
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<EditCubit>(context).deleteTodo(todo);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          body: _body(context).p(15),
        );
      },
    );
  }

  Widget _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: editController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Edit todos message"),
        ),
        10.heightBox,
        CustomButtonW(
          text: "Update Todo",
          onTap: () {
            BlocProvider.of<EditCubit>(context)
                .updateTodo(todo, editController.text);
          },
        ),
        10.heightBox,
        CustomButtonW(
          text: "Popular List",
          onTap: () {
            Navigator.pushNamed(context, POPS_LIST_ROUTE);
          },
        ),
      ],
    );
  }
}
