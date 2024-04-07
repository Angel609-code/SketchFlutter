import 'package:flutter/material.dart';
import 'package:flutter_processing/core/definitions/sketch.dart';

class Sketch extends StatelessWidget {
  const Sketch({
    required this.sketchDefinition,
    super.key,
  });

  final SketchDefinition sketchDefinition;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SizedBox(),
      );
}
