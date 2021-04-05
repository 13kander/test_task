import 'package:expandable/expandable.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:test_task/components/components.dart';
import 'package:test_task/models/product.dart';

class CommodityScreen extends StatelessWidget {
  const CommodityScreen({Key key, @required this.product}) : super(key: key);
  final Product product;

  // ignore: missing_return
  Color raitingColor() {
    if (product.raiting <= 5 && product.raiting >= 4) {
      return ProjectColor.goodRating;
    }
    if (product.raiting < 4 && product.raiting >= 3) {
      return ProjectColor.averageRating;
    }
    if (product.raiting <= 3 && product.raiting >= 0) {
      return ProjectColor.lowRating;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 242,
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(product.imageUrl),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 16, right: 16, bottom: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: product.productName,
                              style: ProjectTextStyles.appBarTitle,
                            ),
                            TextSpan(
                              text: '/1${product.unit}',
                              style: ProjectTextStyles.subtitleBigGrey,
                            )
                          ])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '${product.countRaiting} оценок',
                                style: ProjectTextStyles.subtitleGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 53.75, left: 16, right: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            '${product.price.toString()} ₽',
                            style: ProjectTextStyles.bigPrice,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 24),
                        child: ExpandableText(
                          product.discreption,
                          style: ProjectTextStyles.subtitleBigBlack,
                          maxLines: 2,
                          expandText: '',
                          linkEllipsis: false,
                          expanded: true,
                        ),
                      ),
                      CommodityField(
                          fieldName: 'Вес продукта',
                          fieldValue: product.weight),
                      CommodityField(
                          fieldName: 'Вес продукта с упаковкой',
                          fieldValue: product.weightWithPackaging),
                      CommodityField(
                          fieldName: 'Категория', fieldValue: product.category),
                      CommodityField(
                          fieldName: 'Тип маркировки',
                          fieldValue: product.typeOfMarking),
                      CommodityField(
                          fieldName: 'Срок годности',
                          fieldValue: product.expirationDate),
                      ExpandableNotifier(
                        child: Column(
                          children: [
                            Expandable(
                                collapsed: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 18, bottom: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ExpandableButton(
                                      child: Text(
                                        'Все характеристики >',
                                        style: ProjectTextStyles.price.copyWith(
                                            color: ProjectColor
                                                .backgroundSwitchEnabled),
                                      ),
                                    ),
                                  ),
                                ),
                                expanded: Column(
                                  children: [
                                    CommodityField(
                                        fieldName: 'Вес продукта',
                                        fieldValue: product.weight),
                                    CommodityField(
                                        fieldName: 'Вес продукта с упаковкой',
                                        fieldValue:
                                            product.weightWithPackaging),
                                    CommodityField(
                                        fieldName: 'Категория',
                                        fieldValue: product.category),
                                    CommodityField(
                                        fieldName: 'Тип маркировки',
                                        fieldValue: product.typeOfMarking),
                                    CommodityField(
                                        fieldName: 'Срок годности',
                                        fieldValue: product.expirationDate),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 18,
                                          bottom: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ExpandableButton(
                                          child: Text(
                                            'Скрыть характеристики ˄',
                                            style: ProjectTextStyles.price
                                                .copyWith(
                                                    color: ProjectColor
                                                        .backgroundSwitchEnabled),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: IconContainer(iconPath: ProjectIcons.arrLeft),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: InkWell(
                        onTap: () {},
                        child: IconContainer(
                            iconPath: product.favorite
                                ? ProjectIcons.favoritEnabled
                                : ProjectIcons.favoritDisabled),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
