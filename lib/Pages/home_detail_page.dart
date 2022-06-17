import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price!}".text.bold.red800.xl3.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 45)
          ],
        ).p16(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image!),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEX,
                edge: VxEdge.TOP,
                child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        catalog.name!.text.xl4
                            .color(context.theme.primaryColor)
                            .bold
                            .make(),
                        catalog.desc!.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        """A slim and stylish design makes the Mobile lightweight and easy to carry around._
- Phone is 4 months old and in great condition.
- Rechargeable Li-Ion Battery
- Comes with charger and screen protector."""
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py64()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
