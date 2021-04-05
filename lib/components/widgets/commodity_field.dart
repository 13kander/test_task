import 'package:flutter/material.dart';
import 'package:test_task/components/components.dart';

class CommodityField extends StatelessWidget {
  final String fieldName;
  final String fieldValue;
  CommodityField({@required this.fieldName, @required this.fieldValue})
      : assert(fieldName != null),
        assert(fieldValue != null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            fieldName,
            style: ProjectTextStyles.fieldName,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(height: 1),
              child: CustomPaint(
                painter: DashedLinePainter(),
              ),
            ),
          )),
          Text(
            fieldValue,
            style: ProjectTextStyles.fieldValue,
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  DashedLinePainter(
      {this.dashWidth = 2, this.dashSpace = 2, this.strokeWidth = 2});
  @override
  void paint(Canvas canvas, Size size) {
    // ignore: omit_local_variable_types
    double startX = 0;
    final paint = Paint()
      ..color = ProjectColor.textDivider
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, -(strokeWidth * 2)),
          Offset(startX + dashWidth, -(strokeWidth * 2)), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
