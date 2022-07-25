import 'package:flutter/material.dart';
import 'circle_painter.dart';
import 'horizontal_line_painter.dart';
import 'vertical_line_painter.dart';

class RightLineAndDots extends StatelessWidget {
  const RightLineAndDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: VerticalLinePainter(),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CirclePainter(),
                ),
                HorizontalLinePainter(),
              ],
            ),
          ],
        );
  }
}