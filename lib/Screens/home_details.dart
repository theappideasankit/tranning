import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final ProductModels products;
  const HomeDetails({Key key, @required this.products})
      : assert(products != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH8,
            children: [
              "\$${products.price}".text.bold.xl3.make(),
              ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            CustomWidget.darkBluishColor,
                          ),
                          shape: MaterialStateProperty.all(
                            const StadiumBorder(),
                          )),
                      onPressed: () {},
                      child: "buy".text.make())
                  .wh(100, 50)
            ],
          ).p12(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: CustomWidget.creamColor,
        body: Column(
          children: [
            Hero(
                    tag: Key(products.id.toString()),
                    child: Image.network(products.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 20,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    products.name.text.bold.lg
                        .color(CustomWidget.darkBluishColor)
                        .xl4
                        .make(),
                    products.desc.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    "At et no voluptua amet eos dolor et. Tempor ipsum ut gubergren sanctus dolore stet et ut. Sanctus no sed dolore rebum, sanctus diam stet dolore consetetur magna erat rebum lorem sadipscing. Dolores clita amet sit diam sit ea voluptua et, stet kasd at sit eirmod. Ipsum justo invidunt diam."
                        .text
                        .xl
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
