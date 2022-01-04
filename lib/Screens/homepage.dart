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
        body: (CatalogModels.products != null &&
                CatalogModels.products.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModels.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  final products = CatalogModels.products[index];
                  return Card(
                      elevation: 10.0,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                products.name,
                                style: const TextStyle(color: Colors.white),
                              )),
                          footer: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                products.price.toString(),
                                style: const TextStyle(color: Colors.white),
                              )),
                          child: Image.network(products.image)));
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        drawer: const MyDrawer());
  }
}
