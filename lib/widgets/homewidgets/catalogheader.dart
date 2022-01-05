import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: deprecated_member_use
          "Tranning ".text.xl5.bold.color(context.theme.accentColor).make(),
          // ignore: deprecated_member_use
          "Tranding Products".text.xl.color(context.theme.accentColor).make()
        ],
      ),
    );
  }
}
