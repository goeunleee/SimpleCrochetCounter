import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:arrow/arrow.dart';

class Roulette extends StatefulWidget {
  const Roulette({
    Key? key,
    required this.controller,
    required RouletteStyle style,
  }) : super(key: key);
  final RouletteController controller;

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Roulette(
              // Provide controller to update its state
              controller: widget.controller,
              // Configure roulette's appearance
              style: const RouletteStyle(
                dividerThickness: 0.0,
                dividerColor: Colors.black,
                centerStickSizePercent: 0.01,
                centerStickerColor: Colors.black,
              ),
            ),
          ),
        ),
        // Arrow(),
      ],
    );
  }
}
