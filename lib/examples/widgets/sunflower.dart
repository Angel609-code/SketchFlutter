import 'package:flutter_processing/core/core.dart';
import 'package:flutter_processing/examples/figures/sunflower_sketch.dart';
import 'package:flutter_processing/examples/imports.dart';

const int maxSeeds = 250;

class Sunflower extends StatefulWidget {
  const Sunflower({super.key});

  @override
  State<Sunflower> createState() => _SunflowerState();
}

class _SunflowerState extends State<Sunflower> {
  int seeds = maxSeeds ~/ 2;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(height: 20),
          CanvasBody(
            sketch: SunflowerSketch(
              maxSeeds: maxSeeds,
              seeds: seeds,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Showing $seeds seeds',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 300,
            child: Slider(
              min: 1,
              max: maxSeeds.toDouble(),
              value: seeds.toDouble(),
              onChanged: (double val) {
                setState(() => seeds = val.round());
              },
            ),
          ),
        ],
      );
}
