import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  // List<int> numbers = [];
  void increase() {
    setState(() {
      counter += 1;
      // numbers.add(numbers.length + 1);
    });
  }

  void decrease() {
    if (counter > 0) {
      setState(() {
        counter -= 1;
      });
    }
  }

  void refresh() {
    setState(() {});
    counter = 0;
    // numbers = [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xfff4eddb),
          appBar: AppBar(
            title: const Text(
              'Simple Crochet Counter',
            ),
            backgroundColor: Colors.green.shade100,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Click Count",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "$counter",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: increase,
                      icon: const Icon(Icons.cruelty_free_outlined),
                      iconSize: 45,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: decrease,
                      icon: const Icon(Icons.cruelty_free_sharp),
                      iconSize: 45,
                    ),
                  ],
                ),
                // for (var n in numbers) Text('$n'),
                IconButton(
                  onPressed: refresh,
                  iconSize: 45,
                  icon: const Icon(Icons.replay_circle_filled_rounded),
                ),
                const SizedBox(
                  height: 70,
                ),
                Image.asset('assets/images/sign.png', width: 800, height: 500),
              ],
            ),
          )),
    );
  }
}
