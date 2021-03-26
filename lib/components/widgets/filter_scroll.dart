import 'package:flutter/material.dart';

import '../components.dart';
import 'filter_item.dart';

class FilterScroll extends StatelessWidget {
  const FilterScroll({Key key, @required this.showAppbar}) : super(key: key);
  final bool showAppbar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: showAppbar ? 76.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterItem(
                iconPath: ProjectIcons.sort,
                itemName: 'Сортировать',
                firstItem: true,
              ),
              FilterItem(
                  iconPath: ProjectIcons.vegetablesAndFruits,
                  itemName: 'Овощи и фрукты'),
              FilterItem(
                  iconPath: ProjectIcons.breadAndPastries,
                  itemName: 'Хлеб и выпечка'),
              FilterItem(
                  iconPath: ProjectIcons.milkAndEggs,
                  itemName: 'Молоко и яица'),
              FilterItem(iconPath: ProjectIcons.sort, itemName: 'Сортировать'),
              FilterItem(iconPath: ProjectIcons.sort, itemName: 'Сортировать'),
              FilterItem(iconPath: ProjectIcons.sort, itemName: 'Сортировать'),
              FilterItem(iconPath: ProjectIcons.sort, itemName: 'Сортировать'),
              FilterItem(iconPath: ProjectIcons.sort, itemName: 'Сортировать'),
              FilterItem(
                iconPath: ProjectIcons.sort,
                itemName: 'Сортировать',
                lastItem: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
