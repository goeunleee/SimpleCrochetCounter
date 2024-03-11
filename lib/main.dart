import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _AppState extends State<App> {
  late SharedPreferences prefs;
  int cnt = 0;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final prev = prefs.getInt("cnt");
    setState(() {});
    if (prev != null) {
      counter = prev;
    } else {
      counter = 0;
    }
    print(prefs.getInt("cnt"));
  }

  int counter = 0;
  @override
  void initState() {
    super.initState();
    setState(() {});
    initPrefs();
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
              '몇 단 까지 떴더라?',
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
                  const SizedBox(
                    height: 70,
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
                ],
              ),
            ),
          )),
    );
  }
}
