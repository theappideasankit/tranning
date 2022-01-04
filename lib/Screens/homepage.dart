import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:day1/models/productmodel.dart';
import 'package:day1/widgets/drawer.dart';
import 'package:day1/widgets/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.products = List.from(productsData)
        .map<ProductModels>((item) => ProductModels.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tranning",
          ),
        ),
        body:
            (CatalogModels.products != null && CatalogModels.products.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModels.products.length,
                    itemBuilder: (context, index) {
                      return ProductsWidget(
                        product: CatalogModels.products[index],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
        drawer: const MyDrawer());
  }
}
