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

  bool isEditingTitle = false;
  String title = "";

  List<String> slotTexts = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6"
  ];

  List<TextEditingController> slotControllers = []; // 여기서 선언

  List<bool> isEditingSlot = [false, false, false, false, false, false];

  final List<Color> colors = [
    Colors.red.withOpacity(0.5),
    Colors.green.withOpacity(0.5),
    Colors.blue.withOpacity(0.5),
    Colors.yellow.withOpacity(0.5),
    Colors.amber.withOpacity(0.5),
    Colors.indigo.withOpacity(0.5),
  ];

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    final prev = prefs.getInt("cnt");
    final memo = prefs.getString("memo1");

    final savedTitle = prefs.getString("title");
    if (savedTitle == null) {
      title = "untitled project";
    } else {
      title = savedTitle;
    }

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

    print("memo$memo");
    _textController = TextEditingController(text: text1);
  }

  void saveTitle() async {
    setState(() {
      title = _textController.text.isEmpty
          ? "untitled project "
          : _textController.text;
      isEditingTitle = false;
    });
    await prefs.setString("title", title);
    print("Title saved: $title");
  }

  int counter = 0;
  String text1 = "";

  final icons = <IconData>[
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
    initPrefs();
    assert(colors.length == icons.length);

    for (int i = 0; i < slotTexts.length; i++) {
      slotControllers.add(TextEditingController(text: slotTexts[i]));
    }
    _controller = RouletteController(
      vsync: this,
      group: RouletteGroup.uniform(
        slotTexts.length, // 슬롯 개수
        colorBuilder: (index) => colors[index], // 슬롯 색상
        textBuilder: (index) => slotTexts[index], //  슬롯 텍스트
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

  // 슬롯편집 UI
  Widget buildSlotEditor(int index) {
    return isEditingSlot[index]
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: slotControllers[index],
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        slotTexts[index] = newText;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    setState(() {
                      isEditingSlot[index] = false;
                    });
                  },
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                isEditingSlot[index] = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                slotTexts[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
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
                const SizedBox(height: 40),

                // 제목 수정
                isEditingTitle
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              onChanged: (newTitle) {
                                title = newTitle;
                              },
                              controller: _textController,
                            ),
                          ),
                          IconButton(
                            onPressed: saveTitle, // 저장 버튼
                            icon: const Icon(Icons.save),
                          ),
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditingTitle = true;
                          });
                        },
                        child: Text(
                          title.isEmpty ? "제목없음" : title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                const SizedBox(height: 15),

                const Text(
                  "you did",
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

                // 카운터 버튼들
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

                IconButton(
                  onPressed: refresh,
                  iconSize: 45,
                  icon: const Icon(Icons.replay_circle_filled_rounded),
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
                  ),
                ),

                Image.asset('assets/images/sign.png', width: 800, height: 550),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Roulette(
                        controller: _controller,
                      ),
                    ),
                    Positioned(
                      top: -45,
                      child: Transform.scale(
                        scaleY: 1.5,
                        scaleX: 0.7,
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 110,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => _controller.rollTo(
                        3,
                        clockwise: _clockwise,
                        offset: _random.nextDouble(),
                      ),
                      shape: const CircleBorder(),
                      child: const Text("click"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Column(
                  children: List.generate(slotTexts.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isEditingSlot[index] = true;
                        });
                      },
                      child: isEditingSlot[index]
                          ? TextField(
                              controller:
                                  TextEditingController(text: slotTexts[index]),
                              autofocus: true,
                              onSubmitted: (newText) {
                                setState(() {
                                  slotTexts[index] = newText.isEmpty
                                      ? "Item ${index + 1}"
                                      : newText;
                                  isEditingSlot[index] = false;
                                });
                              },
                            )
                          : Text(
                              slotTexts[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
