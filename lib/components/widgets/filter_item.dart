import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_task/components/components.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {Key key,
      @required this.iconPath,
      @required this.itemName,
      this.firstItem = false,
      this.lastItem = false})
      : super(key: key);
  final String iconPath;
  final String itemName;
  final bool firstItem;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: firstItem ? 16 : 8, right: lastItem ? 16 : 8),
      child: Container(
        height: 76,
        width: 74,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: IconContainer(
                  iconPath: iconPath,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ExpandableText(
                itemName,
                style: ProjectTextStyles.commodityName
                    .copyWith(color: ProjectColor.subtitle),
                maxLines: 2,
                textAlign: TextAlign.center,
                expandText: '',
                linkEllipsis: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
