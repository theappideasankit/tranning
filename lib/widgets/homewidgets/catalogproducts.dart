import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/Screens/home_details.dart';
import 'package:day1/models/cart_model.dart';
import 'package:day1/models/productmodel.dart';
import 'package:day1/widgets/homewidgets/productimage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogProducts extends StatelessWidget {
  final ProductModels productsData;
  const CatalogProducts({Key key, @required this.productsData})
      : assert(productsData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(productsData.id.toString()),
            child: ProductImage(image: productsData.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            productsData.name.text.bold.lg
                .color(context.theme.accentColor)
                .make(),
            productsData.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${productsData.price}".text.bold.xl.make(),
                AddToCart(products: productsData)
              ],
            ).pOnly(right: 8.0)
          ],
        )),
        10.heightBox
      ],
    )).rounded.color(context.cardColor).square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final ProductModels products;

  const AddToCart({Key key, this.products}) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            )),
        onPressed: () {
          isAdded = isAdded.toggle();
          final _products = CatalogModels();
          final _cart = CartModel();
          _cart.products = _products;
          _cart.add(widget.products);
          setState(() {});
        },
        child: isAdded ? Icon(Icons.done) : "Buy".text.make());
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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetails(products: productsData))),
            child: CatalogProducts(productsData: productsData));
      },
    );
  }
}
