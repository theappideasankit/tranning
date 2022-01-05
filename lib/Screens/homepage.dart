import 'dart:convert';
import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/utils/routes.dart';
import 'package:day1/widgets/homewidgets/catalogheader.dart';
import 'package:day1/widgets/homewidgets/catalogproducts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoute.CartRoute),
          backgroundColor: CustomWidget.darkBluishColor,
          child: FaIcon(FontAwesomeIcons.cartPlus),
        ),
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
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
