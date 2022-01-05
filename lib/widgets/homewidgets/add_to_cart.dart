import 'package:day1/models/cart_model.dart';
import 'package:day1/models/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final ProductModels products;

  AddToCart({Key key, this.products}) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isIncart = _cart.productss.contains(products) ?? false;

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              // ignore: deprecated_member_use
              context.theme.buttonColor,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            )),
        onPressed: () {
          if (!isIncart) {
            isIncart = isIncart.toggle();
            final _products = CatalogModels();
            _cart.products = _products;
            _cart.add(products);
           // setState(() {});
          }
        },
        child:
            isIncart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
