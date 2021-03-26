import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_task/models/data.dart';

import 'commodity_container.dart';

class CommodityScroll extends StatelessWidget {
  const CommodityScroll(
      {Key key, @required this.scrollViewController, @required this.data})
      : super(key: key);
  final ScrollController scrollViewController;
  final Data data;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      controller: scrollViewController,
      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      staggeredTiles:
          List.generate(data.product.length, (index) => StaggeredTile.fit(1)),
      children:
          data.product.map((e) => CommodityContainer(product: e)).toList(),
    );
  }
}
