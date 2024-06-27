// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'dart:async'; // Import the dart:async package

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    super.key,
    this.width,
    this.height,
    required this.duration,
  });

  final double? width;
  final double? height;
  final int duration;

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  late DateTime startTime;

  @override
  void initState() {
    super.initState();
    startTime = FFAppState().startTime ?? DateTime.now();
    FFAppState().startTime =
        startTime; // Save the start time in app state if not already saved

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..addListener(() {
        setState(() {});
      });

    // Calculate initial progress
    final elapsed = DateTime.now().difference(startTime);
    final initialProgress = elapsed.inMilliseconds / (widget.duration * 1000);
    if (initialProgress < 1.0) {
      _controller.value = initialProgress;
      _controller.forward(); // Continue the animation from the current progress
    } else {
      _controller.value =
          1.0; // Set to completed if the duration has already elapsed
      FFAppState().startTime =
          null; // Reset the start time if the duration is complete
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (_controller.value * 100).clamp(0, 100);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              percentage.toInt().toString(),
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
            Text(
              ".${percentage.toStringAsFixed(1).split('.').last} %",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 50),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              height: widget.height ?? 300,
              width: widget.width ?? 300,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomPaint(
                      painter: LiquidPainter(
                        _controller.value * widget.duration,
                        widget.duration.toDouble(),
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: RadialProgressPainter(
                      value: _controller.value * widget.duration,
                      backgroundGradientColors: [
                        Color(0xffFF0069),
                        Color(0xffFED602),
                        Color(0xff7639FB),
                        Color(0xffD500C5),
                        Color(0xffFF7A01),
                        Color(0xffFF0069),
                      ],
                      minValue: 0,
                      maxValue: widget.duration.toDouble(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 50),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                Duration elapsed = DateTime.now().difference(startTime);
                double progressValue = (elapsed.inSeconds / widget.duration)
                    .clamp(0, 1)
                    .toDouble();
                _controller.value = progressValue;
                _controller.forward();
              }
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 2),
              shape: BoxShape.circle,
            ),
            child: AnimatedContainer(
              height: _controller.isAnimating ? 25 : 60,
              width: _controller.isAnimating ? 25 : 60,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(_controller.isAnimating ? 4 : 100),
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LiquidPainter extends CustomPainter {
  final double value;
  final double maxValue;

  LiquidPainter(this.value, this.maxValue);

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = min(size.height, size.width);
    double radius = diameter / 2;
    double pointX = 0;
    double pointY = diameter - ((diameter + 10) * (value / maxValue));

    Path path = Path();
    path.moveTo(pointX, pointY);
    double amplitude = 10;
    double period = value / maxValue;
    double phaseShift = value * pi;

    for (double i = 0; i <= diameter; i++) {
      path.lineTo(
        i + pointX,
        pointY + amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
      );
    }

    path.lineTo(pointX + diameter, diameter);
    path.lineTo(pointX, diameter);
    path.close();

    Paint paint = Paint()
      ..shader = const SweepGradient(
        colors: [Color(0xffFF7A01), Color(0xffFF0069), Color(0xff7639FB)],
        startAngle: pi / 2,
        endAngle: 5 * pi / 2,
        tileMode: TileMode.clamp,
        stops: [0.25, 0.35, 0.5],
      ).createShader(Rect.fromCircle(
          center: Offset(diameter / 2, diameter / 2), radius: radius))
      ..style = PaintingStyle.fill;

    Path circleClip = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(radius, radius), width: diameter, height: diameter));
    canvas.clipPath(circleClip, doAntiAlias: true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RadialProgressPainter extends CustomPainter {
  final double value;
  final List<Color> backgroundGradientColors;
  final double minValue;
  final double maxValue;

  RadialProgressPainter({
    required this.value,
    required this.backgroundGradientColors,
    required this.minValue,
    required this.maxValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double diameter = min(size.height, size.width);
    final double radius = diameter / 2;
    final double centerX = radius;
    final double centerY = radius;

    const double strokeWidth = 6;

    final Paint progressPaint = Paint()
      ..shader = SweepGradient(
        colors: backgroundGradientColors,
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        tileMode: TileMode.repeated,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint progressTrackPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * value / maxValue;

    canvas.drawCircle(Offset(centerX, centerY), radius, progressTrackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
