import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:test_task/components/components.dart';
import 'package:test_task/models/product.dart';
import 'package:test_task/screens/commodity_screen.dart';

class CommodityContainer extends StatelessWidget {
  const CommodityContainer({Key key, @required this.product}) : super(key: key);
  final Product product;

  // ignore: missing_return
  Color raitingColor() {
    if (product.raiting <= 5 && product.raiting >= 4)
      return ProjectColor.goodRating;
    if (product.raiting < 4 && product.raiting >= 3)
      return ProjectColor.averageRating;
    if (product.raiting <= 3 && product.raiting >= 0)
      return ProjectColor.lowRating;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CommodityScreen(product: product)));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: ProjectColor.iconBorder),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 121,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(product.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 13, left: 12, right: 12, bottom: 27),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: product.productName,
                        style: ProjectTextStyles.commodityName,
                      ),
                      TextSpan(
                        text: '/1${product.unit}',
                        style: ProjectTextStyles.subtitleGrey,
                      )
                    ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: raitingColor()),
                        child: Center(
                          child: Text(
                            product.raiting.toString(),
                            style: ProjectTextStyles.raiting,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '${product.countRaiting} оценок',
                          style: ProjectTextStyles.subtitleGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ExpandableText(
                    product.discreption,
                    style: ProjectTextStyles.subtitleGrey,
                    maxLines: 2,
                    expandText: '',
                    linkEllipsis: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      product.brand,
                      style: ProjectTextStyles.subtitleBlack,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 21, bottom: 24, left: 12, right: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '${product.price.toString()} ₽',
                      style: ProjectTextStyles.price,
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {},
                  child: IconContainer(
                    iconPath: product.favorite
                        ? ProjectIcons.favoritEnabled
                        : ProjectIcons.favoritDisabled,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
