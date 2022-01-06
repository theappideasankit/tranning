import 'package:day1/App1/core/store.dart';
import 'package:day1/App1/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

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
          CartList().p12().expand(),
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
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .bold
                  .color(Vx.red800)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          // ignore: deprecated_member_use
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: "your balance is low".text.make()),
                    );
                  },
                  child: "Buy".text.xl.make())
              .cornerRadius(18)
              .wh(100, 40),
        ],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return _cart.productss.isEmpty
        ? "products not founds".text.xl.makeCentered()
        : ListView.builder(
            itemCount: _cart.productss?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: _cart.productss[index].name.text.make(),
                leading: const FaIcon(FontAwesomeIcons.cartArrowDown),
                trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.productss[index]),
                    icon: const Icon(Icons.remove)),
              );
            },
          );
  }
}