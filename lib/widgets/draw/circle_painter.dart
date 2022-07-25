import 'package:flutter/material.dart';

class CirclePainter extends StatelessWidget {
  const CirclePainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: CustomPaint(
        foregroundPainter: CirclePaint(),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 1, size.height * 0);
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeCap = StrokeCap.round
      ..color = Colors.amber
      ..strokeWidth = 1;

    canvas.drawCircle(center, size.width * .08, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
