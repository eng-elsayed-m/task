part of '../movies_page.dart';

class HomeBG extends StatelessWidget {
  final double height;
  final double width;
  final bool isTopRated;
  const HomeBG(
      {super.key,
      required this.height,
      required this.width,
      required this.isTopRated});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FramePainter(height, width, isTopRated: isTopRated),
      child: SizedBox(height: height, width: width),
    );
  }
}

class FramePainter extends CustomPainter {
  final double height;
  final double width;
  final bool isTopRated;
  FramePainter(this.height, this.width, {required this.isTopRated});
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = Colors.red;
    final fillPaintP = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = Colors.white;
    final topFramePath = Path();
    topFramePath.moveTo(0.0, size.height * 0.08);

    topFramePath.lineTo(0, size.height * 0.3);
    topFramePath.quadraticBezierTo(
        size.width / 3, size.height / 3, size.width, size.height * 0.31);
    topFramePath.lineTo(size.width, 5);
    topFramePath.lineTo(size.width * 0.62, size.height * 0.04);
    topFramePath.lineTo(size.width * 0.62, size.height * 0.13);
    topFramePath.lineTo(size.width * 0.38, size.height * 0.13);
    topFramePath.lineTo(size.width * 0.38, size.height * 0.04);
    topFramePath.lineTo(0, 5);

    final bottomFramePath = Path();
    bottomFramePath.moveTo(0.0, size.height * 0.07);

    bottomFramePath.lineTo(0, size.height * 0.32);
    bottomFramePath.quadraticBezierTo(
        size.width / 2.6, size.height * 0.33, size.width, size.height * 0.32);
    bottomFramePath.lineTo(size.width, 0);
    bottomFramePath.lineTo(size.width * 0.61, size.height * 0.035);
    bottomFramePath.lineTo(size.width * 0.61, size.height * 0.125);
    bottomFramePath.lineTo(size.width * 0.39, size.height * 0.125);
    bottomFramePath.lineTo(size.width * 0.39, size.height * 0.035);
    bottomFramePath.lineTo(0, 0);

    canvas.drawPath(bottomFramePath, fillPaintP);
    canvas.drawPath(topFramePath, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
