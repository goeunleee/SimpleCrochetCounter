import 'package:crochet_counter/screens/more_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:roulette/roulette.dart';
import '../widgets/counter_controls.dart';
import '../widgets/project_list.dart';
import '../widgets/button.dart'; // Button 위젯 추가
import '../models/project.dart';
import '../managers/project_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late SharedPreferences prefs;
  ProjectManager manager = ProjectManager();
  int cnt = 0;
  static final _random = Random();
  late RouletteController _controller;
  late TextEditingController _textController;
  bool isEditingTitle = false;
  String title = "";
  int selectedProjectIndex = -1;
  final TextEditingController _editTextController = TextEditingController();
  int? editingIndex;

  @override
  void initState() {
    super.initState();
    initPrefs();
    _controller = RouletteController(
      vsync: this,
      group: RouletteGroup.uniform(
        5,
        textBuilder: (index) => [
          'Item 1',
          'Item 2',
          'Item 3',
          'Item 4',
          'Item 5',
        ][index],
        colorBuilder: (index) => [
          Colors.red.withOpacity(0.5),
          Colors.green.withOpacity(0.5),
          Colors.blue.withOpacity(0.5),
          Colors.yellow.withOpacity(0.5),
          Colors.purple.withOpacity(0.5),
        ][index],
      ),
    );
    _textController = TextEditingController();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final prev = prefs.getInt("cnt");
    if (prev != null) cnt = prev;

    final savedTitle = prefs.getString("title");
    title = savedTitle ?? "untitled project";

    List<String>? projects = prefs.getStringList("projects");
    if (projects != null) {
      manager.octopus = projects.map((projectString) {
        return Project.fromJson(projectString);
      }).toList();
      if (manager.octopus.isNotEmpty) {
        selectProject(0);
      }
    }

    setState(() {});
  }

  void selectProject(int index) {
    selectedProjectIndex = index;
    cnt = manager.octopus[index].counter;
    setState(() {
      title = manager.octopus[index].title;
    });
  }

  Future<void> saveProjectsToCache() async {
    List<String> projects =
        manager.octopus.map((project) => project.toJson()).toList();
    await prefs.setStringList('projects', projects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4eddb),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Simple Crochet Counter"),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              manager.octopus.isEmpty
                  ? ElevatedButton(
                      onPressed: () {
                        if (manager.octopus.length < 5) {
                          Project newProject = Project(
                            title: " ${manager.octopus.length + 1}번째 프로젝트",
                            counter: 0,
                          );
                          manager.addProject(newProject);
                          setState(() {
                            saveProjectsToCache();
                            selectProject(0);
                          });
                        }
                      },
                      child: const Text("프로젝트 시작하기"),
                    )
                  : Column(
                      children: [
                        if (manager.octopus.isNotEmpty)
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 10),
                        CounterControls(
                          cnt: cnt,
                          increase: () {
                            setState(() {
                              cnt++;
                              manager.octopus[selectedProjectIndex].counter =
                                  cnt;
                            });
                          },
                          decrease: () {
                            if (cnt > 0) {
                              setState(() {
                                cnt--;
                                manager.octopus[selectedProjectIndex].counter =
                                    cnt;
                              });
                            }
                          },
                          refresh: () {
                            setState(() {
                              cnt = 0;
                              manager.octopus[selectedProjectIndex].counter = 0;
                            });
                          },
                        ),
                      ],
                    ),
              const SizedBox(height: 40),
              ProjectList(
                projects: manager.octopus,
                onSelectProject: selectProject,
                onStartEditingProject: (index) {
                  setState(() {
                    editingIndex = index;
                  });
                },
                onSaveEditProject: (index, newTitle) {
                  setState(() {
                    manager.octopus[index].title = newTitle;
                    editingIndex = null;
                  });
                  saveProjectsToCache();
                },
                onDeleteProject: (index) {
                  setState(() {
                    manager.octopus.removeAt(index);
                    if (selectedProjectIndex == index) {
                      title = "untitled project";
                      cnt = 0;
                    }
                  });
                  saveProjectsToCache();
                },
                onAddProject: () {
                  if (manager.octopus.length < 5) {
                    Project newProject = Project(
                      title: " ${manager.octopus.length + 1}번째 프로젝트",
                      counter: 0,
                    );
                    manager.addProject(newProject);
                    setState(() {
                      saveProjectsToCache();
                      selectProject(0);
                    });
                  }
                },
                editingIndex: editingIndex,
                editTextController: _editTextController,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<MoreInfo>(
                        builder: (BuildContext context) {
                      return const MoreInfo();
                    }),
                  );
                },
                child: const Text('용어가 어려울 땐?'),
              ),
              const SizedBox(height: 50),
              const Text(
                "그냥 운에 맡기기",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.6,
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
                      _random.nextInt(5),
                      offset: _random.nextDouble(),
                    ),
                    shape: const CircleBorder(),
                    child: const Text("Click"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
