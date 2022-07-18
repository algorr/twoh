import 'package:flutter/material.dart';

class HorizontalXLinePainter extends StatelessWidget {
  const HorizontalXLinePainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: CustomPaint(
        foregroundPainter: LinePaint(),
      ),
    );
  }
}

class LinePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawLine(Offset(size.width * -0.9, size.height * 0),
        Offset(size.width * -.09, size.height * .001), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
