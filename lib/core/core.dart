import 'package:flutter/material.dart';
import 'package:flutter_processing/core/definitions/sketch_definition.dart';

class CanvasBody extends StatefulWidget {
  const CanvasBody({
    required this.sketch,
    super.key,
  });

  final SketchDefinition sketch;

  @override
  State<CanvasBody> createState() => _CanvasBodyState();
}

class _CanvasBodyState extends State<CanvasBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.sketch.setup();
    return CustomPaint(
      size: widget.sketch.canvasSize,
      painter: _CustomPainter(
        widget.sketch,
        _controller,
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {
  _CustomPainter(this.sketch, this.animation) : super(repaint: animation);

  final SketchDefinition sketch;
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    sketch
      ..canvas = canvas
      ..draw();
  }

  @override
  bool shouldRepaint(_CustomPainter oldDelegate) => false;
}
