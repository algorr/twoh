import 'package:flutter/material.dart';
import 'circle_painter.dart';
import 'horizontal_x_line_painter.dart';
import 'vertical_line_painter.dart';

class LeftLineAndDots extends StatelessWidget {
  const LeftLineAndDots({Key? key}) : super(key: key);

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
            HorizontalXLinePainter(),
          ],
        ),
      ],
    );
  }
}
