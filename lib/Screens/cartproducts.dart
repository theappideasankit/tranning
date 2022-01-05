import 'package:day1/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const CartList().p32().expand(),
          const Divider(),
          const TotalCart(),
        ],
      ),
    );
  }
}

class TotalCart extends StatelessWidget {
  const TotalCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: "your balance is low".text.make()),
                    );
                  },
                  child: "Buy".text.xl.make())
              .w24(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.productss.isEmpty
        ? "products not founds".text.xl.makeCentered()
        : ListView.builder(
            itemCount: _cart.productss?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: _cart.productss[index].name.text.make(),
                leading: const FaIcon(FontAwesomeIcons.cartArrowDown),
                trailing: IconButton(
                    onPressed: () {
                      _cart.remove(_cart.productss[index]);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove)),
              );
            },
          );
  }
}
