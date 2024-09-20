import 'package:flutter/material.dart';

class CounterControls extends StatelessWidget {
  final int cnt;
  final VoidCallback increase;
  final VoidCallback decrease;
  final VoidCallback refresh;

  const CounterControls({
    super.key,
    required this.cnt,
    required this.increase,
    required this.decrease,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("지금 까지", style: TextStyle(fontSize: 15)),
        Text(
          "$cnt",
          style: const TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: increase,
              icon: const Icon(Icons.cruelty_free_outlined),
              iconSize: 45,
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: decrease,
              icon: const Icon(Icons.cruelty_free_sharp),
              iconSize: 45,
            ),
          ],
        ),
        IconButton(
          onPressed: refresh,
          iconSize: 45,
          icon: const Icon(Icons.replay_circle_filled_rounded),
        ),
      ],
    );
  }
}
