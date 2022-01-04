import 'dart:convert';
import 'package:day1/CustomWidgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:day1/models/productmodel.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: CustomWidget.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModels.products != null &&
                  CatalogModels.products.isNotEmpty)
                CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Tranning ".text.xl5.bold.color(CustomWidget.darkBluishColor).make(),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModels.products.length,
      itemBuilder: (context, index) {
        final productsData = CatalogModels.products[index];
        return CatalogProducts(productsData: productsData);
      },
    );
  }
}

class CatalogProducts extends StatelessWidget {
  final ProductModels productsData;
  CatalogProducts({Key key, @required this.productsData})
      : assert(productsData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        ProductImage(image: productsData.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            productsData.name.text.bold.lg
                .color(CustomWidget.darkBluishColor)
                .make(),
            productsData.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${productsData.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: () {}, child: "buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).rounded.white.square(150).make().py16();
  }
}

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p12
        .color(CustomWidget.creamColor)
        .make()
        .py12()
        .w32(context);
  }
}
