import 'package:flutter/material.dart';

class StadiumPainter extends StatelessWidget {
  StadiumPainter(
      {Key? key, required this.color, required this.p1, required this.p2})
      : super(key: key);
  Color color;
  double p1;
  double p2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 15,
      child: CustomPaint(
        foregroundPainter: StadiumPaint(color: color, p1: p1, p2: p2),
      ),
    );
  }
}

class StadiumPaint extends CustomPainter {
  StadiumPaint({required this.color, required this.p1, required this.p2});
  Color color;
  double p1;
  double p2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * -1, size.height * 1);
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeCap = StrokeCap.round
      ..color = Colors.red
      ..strokeWidth = 9;

    //canvas.drawCircle(center, size.width * .08, paint);
    canvas.drawLine(Offset(size.width * -1.5, size.height * .3),
        Offset(size.width * -1.8, size.height * .3), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
