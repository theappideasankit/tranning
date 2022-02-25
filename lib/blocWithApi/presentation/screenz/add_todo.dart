import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/blocWithApi/constantsss/str.dart';
import 'package:day1/blocWithApi/cubit/add_cubit.dart';
import 'package:day1/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key key}) : super(key: key);

  final TextEditingController addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Todos".text.make(),
      ),
      body: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state is AddedTodo) {
            Navigator.popAndPushNamed(context, BLOC_WITH_API);
          } else if (state is AddTodoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: state.error.text.make(),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: _body(context),
      ).p(15),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: addController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Enter todos message"),
        ),
        10.heightBox,
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
          shadowColor: Colors.black,
          child: InkWell(
            splashColor: Colors.blue,
            onTap: () {
              final message = addController.text;
              BlocProvider.of<AddCubit>(context).addTodo(message);
            },
            child: SizedBox(
              child: BlocBuilder<AddCubit, AddState>(
                builder: (context, state) {
                  if (state is AddingTodo) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return "Add"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered();
                },
              ),
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        /*  CustomButtonW(
              text: "Add",
              onTap: () {
                final message = addController.text;
                BlocProvider.of<AddCubit>(context).addTodo(message);
              },
            )*/
      ],
    );
  }
}
