import 'package:day1/models/productmodel.dart';
import 'package:day1/widgets/drawer.dart';
import 'package:day1/widgets/products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int days = 4;
    // String name = " Today I'm joining TheAppIdeas Company";
    // double pi = 3.14;
    // num temp = 50.5;
    // var data = "hello how are you";
    //  studentsMethod();
    final newList = List.generate(25, (index) => CatalogModel.products[0]);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "day1",
          ),
        ),
        body: ListView.builder(
          itemCount: newList.length,
          itemBuilder: (context, index) {
            return ProductsWidget(
              product: newList[index],
            );
          },
        ),
        drawer: const MyDrawer());
  }
}
