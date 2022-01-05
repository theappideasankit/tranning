import 'package:day1/models/cart_model.dart';
import 'package:day1/models/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final ProductModels products;

  const AddToCart({Key key, this.products}) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isIncart = _cart.productss.contains(widget.products) ?? false;

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
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
            _cart.add(widget.products);
            setState(() {});
          }
        },
        child:
            isIncart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
