// ignore_for_file: unused_import, unused_field, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:roulette/roulette.dart';
import 'package:arrow/arrow.dart';

void main() {
  runApp(const App());
}

class Button extends StatelessWidget {
  final String name;

  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late SharedPreferences prefs;

  int cnt = 0;
  static final _random = Random();

  late RouletteController _controller;
  late TextEditingController _textController;
  final bool _clockwise = true;
  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    final prev = prefs.getInt("cnt");
    final memo = prefs.getString("memo1");
    setState(() {});
    if (prev != null) {
      counter = prev;
    } else {
      counter = 0;
    }
    if (memo == null) {
      text1 = "";
    } else {
      text1 = memo;
    }
    // print(prefs.getInt("cnt"));
    print("memo$memo");
    _textController = TextEditingController(text: text1);
  }

  int counter = 0;
  String text1 = "";
  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  final icons = <IconData>[
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
  ];

  final images = <ImageProvider>[
    // Use [AssetImage] if you have 2.0x, 3.0x images,
    // We only have 1 exact image here
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://picsum.photos/seed/example1/400"),
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://bad.link.to.image"),
    const ExactAssetImage("asset/gradient.jpg"),
    const NetworkImage("https://picsum.photos/seed/example5/400"),
    // MemoryImage(...)
    // FileImage(...)
    // ResizeImage(...)
  ];
  @override
  void initState() {
    super.initState();
    setState(() {});
    initPrefs();
    assert(colors.length == icons.length);
    assert(colors.length == images.length);

    _controller = RouletteController(
      vsync: this,
      group: RouletteGroup.uniformImages(
        colors.length,
        colorBuilder: (index) => colors[index],
        imageBuilder: (index) => images[index],
        textBuilder: (index) {
          if (index == 0) return 'i0';
          return 'else';
        },
        styleBuilder: (index) {
          return const TextStyle(color: Colors.black);
        },
      ),
    );
  }

  void increase() async {
    final now = prefs.getInt("cnt");
    if (now == null) {
      prefs.setInt("cnt", 1);
    } else {
      prefs.setInt("cnt", now + 1);
    }
    setState(() {
      counter = prefs.getInt("cnt")!;
    });
  }

  void decrease() {
    if (counter > 0) {
      setState(() {
        counter -= 1;
      });
    }
    final now = prefs.getInt("cnt");
    if (now == null || now == 0) {
      prefs.setInt("cnt", 0);
    } else {
      prefs.setInt("cnt", now - 1);
    }
  }

  void refresh() {
    setState(() {});
    counter = 0;
    prefs.setInt("cnt", 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xfff4eddb),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'simple crochet counter',
            ),
            backgroundColor: Colors.green.shade100,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
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
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          const Text(
                            'list',
                            style: TextStyle(fontSize: 24),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: _textController,
                                  onChanged: (text) {
                                    //  prefs.setInt("cnt", 0);
                                    // prefs.setString("memo1", text);
                                  },
                                  maxLength: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Button(name: "slip/ss"),
                              SizedBox(
                                width: 10,
                              ),
                              Button(name: "ch"),
                              SizedBox(
                                width: 10,
                              ),
                              Button(name: "sc"),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Button(name: "half-double"),
                              SizedBox(
                                width: 10,
                              ),
                              Button(name: "double"),
                            ],
                          ),
                        ],
                      )),
                  Image.asset('assets/images/sign.png',
                      width: 800, height: 550),
                  const SizedBox(
                    height: 100,
                  ),
                  Roulette(controller: _controller),
                  FloatingActionButton(
                    onPressed: () => _controller.rollTo(
                      3,
                      clockwise: _clockwise,
                      offset: _random.nextDouble(),
                    ),
                    child: const Icon(Icons.refresh_rounded),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
