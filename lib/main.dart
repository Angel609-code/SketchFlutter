import 'package:flutter/material.dart';
import 'package:flutter_processing/core/core.dart';
import 'package:flutter_processing/examples/perlin_noise/perlin_noise_graph.dart';
// import 'package:flutter_processing/examples/perlin_noise/perlin_noise_basic.dart';
// import 'package:flutter_processing/examples/widgets/sunflower.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: const Text(
              'Sketch',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: SingleChildScrollView(
            child: CanvasBody(
              sketch: PerlinNoiseGraph(),
            ),
            // child: Sunflower(),
          ),
        ),
      );
}
