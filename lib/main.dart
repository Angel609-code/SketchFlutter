import 'package:flutter/material.dart';
import 'package:flutter_processing/core/core.dart';
import 'package:flutter_processing/examples/perlin_noise/perlin_noise1.dart';
// import 'package:flutter_processing/examples/sunflower_sketch.dart';

void main() {
  runApp(const MyApp());
}

// const int maxSeeds = 250;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // int seeds = maxSeeds ~/ 2;
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 28, 29, 31),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: const Text(
              'Sketch',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                // CanvasBody(
                //   sketch: SunflowerSketch(
                //     maxSeeds: maxSeeds,
                //     seeds: seeds,
                //   ),
                // ),
                CanvasBody(
                  sketch: PerlinNoise1(),
                ),
                // const SizedBox(height: 20),
                // Text(
                //   'Showing $seeds seeds',
                //   style: const TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                // SizedBox(
                //   width: 300,
                //   child: Slider(
                //     min: 1,
                //     max: maxSeeds.toDouble(),
                //     value: seeds.toDouble(),
                //     onChanged: (double val) {
                //       setState(() => seeds = val.round());

                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
