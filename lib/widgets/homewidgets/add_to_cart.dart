import 'package:day1/core/store.dart';
import 'package:day1/models/cart_model.dart';
import 'package:day1/models/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final ProductModels products;

  const AddToCart({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cartModel;
   // final CatalogModels _products = (VxState.store as MyStore).products;
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
            AddMutation(products);
            // setState(() {});
          }
        },
        child: isIncart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
