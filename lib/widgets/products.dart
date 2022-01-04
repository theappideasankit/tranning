import 'package:day1/models/productmodel.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final ProductModel product;
  const ProductsWidget({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 1.0,
        child: ListTile(
          onTap: () {
            // ignore: avoid_print
            print("pressed");
          },
          leading: Image.network(product.urlImage),
          title: Text(product.name),
          subtitle: Text(product.desc),
          trailing: Text(
            "\$${product.price}",
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
