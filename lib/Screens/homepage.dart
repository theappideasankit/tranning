import 'dart:convert';

import 'package:day1/core/store.dart';
import 'package:day1/models/cart_model.dart';
import 'package:day1/utils/routes.dart';
import 'package:day1/widgets/homewidgets/catalogheader.dart';
import 'package:day1/widgets/homewidgets/catalogproducts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:day1/models/productmodel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url =
      "https://my-json-server.typicode.com/theappideasankit/jsonfile/db";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    final resoponse = await http.get(Uri.parse(url));
    final catalogJson = resoponse.body;
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.products = List.from(productsData)
        .map<ProductModels>((item) => ProductModels.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (ctx, status, store) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoute.CartRoute),
            // ignore: deprecated_member_use
            backgroundColor: context.theme.buttonColor,
            child: const FaIcon(
              FontAwesomeIcons.cartPlus,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.productss.length,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        backgroundColor: context.canvasColor,
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
