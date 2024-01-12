import 'package:flutter/material.dart';

import '../../../utils/enum/enum.dart';
import 'dash_path.dart';

class Line extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry margin;
  final double lineHeight;

  const Line({Key? key, this.color, this.margin = const EdgeInsets.only(top: 10.0, bottom: 10.0), this.lineHeight = 0.2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: lineHeight, color: color ?? Theme.of(context).dividerColor, margin: margin);
  }
}

class DashLine extends StatelessWidget {
  final double lineHeight;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const DashLine({
    Key? key,
    this.color,
    this.lineHeight = 0.2,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomPaint(
        painter: DashPathPainter(lineHeight, color ?? Theme.of(context).dividerColor),
        size: Size.fromHeight(lineHeight),
      ),
    );
  }
}

class DashPathPainter extends CustomPainter {
  final double lineHeight;
  final Color color;

  DashPathPainter(this.lineHeight, this.color)
      : black = Paint()
          ..color = color
          ..strokeWidth = lineHeight
          ..style = PaintingStyle.stroke,
        path = Path();

  final Paint black;

  final Path path;

  @override
  bool shouldRepaint(DashPathPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    path
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawPath(
        dashPath(
          path,
          dashArray: CircularIntervalList<double>(
            <double>[5.0, 2.5],
          ),
        ),
        black);
  }
}

class LineWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final LineType? lineType;

  const LineWidget({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lineType == LineType.vertical) {
      return _buildVerticalLine(context, color);
    } else {
      if (lineType == LineType.horizontal) {
        return _buildHorizontalLine(context, color);
      } else {
        return _buildVerticalLine(context, color);
      }
    }
  }

  Widget _buildVerticalLine(context, color) {
    return Container(
      height: height ?? 1.0,
      width: width,
      color: color ?? Theme.of(context).dividerColor,
    );
  }

  Widget _buildHorizontalLine(context, color) {
    return Container(
      height: height,
      width: width ?? 1.0,
      color: color ?? Theme.of(context).dividerColor,
    );
  }
}

class DashedLine extends StatelessWidget {
  final double height;
  final double heightContainer;
  final Color color;

  const DashedLine({super.key, this.height = 3, this.color = Colors.black, this.heightContainer = 70});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightContainer,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          const dashWidth = 10.0;
          final dashHeight = height;
          final dashCount = (boxHeight / (2 * dashHeight)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 2;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
