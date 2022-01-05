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
          const _TotalCart(),
        ],
      ),
    );
  }
}

class _TotalCart extends StatelessWidget {
  const _TotalCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$1000".text.xl4.color(context.accentColor).make(),
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
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: "products".text.make(),
          leading: const FaIcon(FontAwesomeIcons.cartArrowDown),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
        );
      },
    );
  }
}
