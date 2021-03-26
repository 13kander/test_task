import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/components/components.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key key, @required this.iconPath}) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ProjectColor.iconBorder),
          borderRadius: BorderRadius.circular(100),
          color: ProjectColor.appBarBackground),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          height: 16,
          width: 16,
        ),
      ),
    );
  }
}
