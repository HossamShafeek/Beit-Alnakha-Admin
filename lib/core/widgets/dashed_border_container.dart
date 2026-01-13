import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final double height;
  final double radius;
  final Color? color;
  final double strokeWidth;
  final List<double> dashPattern;
  final Widget? child;

  const DashedBorderContainer({
    super.key,
     this.height=200,
     this.radius=AppSize.size12,
     this.color,
    this.strokeWidth = 1,
    this.dashPattern = const [6, 3],
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: color??AppColors.grey400,
        radius: radius,
        strokeWidth: strokeWidth,
        dashPattern: dashPattern,
      ),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final List<double> dashPattern;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);

    final dashedPath = _createDashedPath(path, dashPattern);

    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path source, List<double> dashArray) {
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      int index = 0;

      while (distance < metric.length) {
        final double length = dashArray[index % dashArray.length];
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + length),
            Offset.zero,
          );
        }
        distance += length;
        draw = !draw;
        index++;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
