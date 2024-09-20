import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:roulette/roulette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/button.dart';
import 'widgets/counter_controls.dart';
import 'models/project.dart';
import 'managers/project_manager.dart';
import 'widgets/project_list.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late SharedPreferences prefs;
  ProjectManager manager = ProjectManager();
  int cnt = 0;
  static final _random = Random();
  late RouletteController _controller;
  late TextEditingController _textController;
  bool isEditingTitle = false;
  String title = "";
  int selectedProjectIndex = -1;
  bool isEditingListTitle = false;
  final TextEditingController _editTextController = TextEditingController();
  int? editingIndex; // 편집 중인 인덱스 관리

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

  void saveListTitle(int index) {
    setState(() {
      manager.octopus[index].title = _editTextController.text.isEmpty
          ? "untitled project"
          : _editTextController.text;
      isEditingListTitle = false;
    });
    saveProjectsToCache();
  }

  void deleteProject(int index) async {
    setState(() {
      manager.octopus.removeAt(index);
      if (selectedProjectIndex == index) {
        title = "untitled project";
        cnt = 0;
      }
    });
    await saveProjectsToCache();
  }

  void increase() async {
    setState(() {
      cnt += 1;
      manager.octopus[selectedProjectIndex].counter = cnt;
    });
    await saveProjectsToCache();
  }

  void decrease() async {
    if (cnt > 0) {
      setState(() {
        cnt -= 1;
        manager.octopus[selectedProjectIndex].counter = cnt;
      });
      await saveProjectsToCache();
    }
  }

  Future<void> saveProjectsToCache() async {
    List<String> projects =
        manager.octopus.map((project) => project.toJson()).toList();
    await prefs.setStringList('projects', projects);
  }

  void refresh() async {
    setState(() {
      cnt = 0;
      manager.octopus[selectedProjectIndex].counter = 0;
    });
    await saveProjectsToCache();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                            increase: increase,
                            decrease: decrease,
                            refresh: refresh,
                          ),
                        ],
                      ),
                const SizedBox(height: 40),
                ProjectList(
                  projects: manager.octopus,
                  onSelectProject: selectProject,
                  onStartEditingProject: (index) {
                    // 수정 버튼을 눌렀을 때 수정 모드로 전환
                    setState(() {
                      editingIndex = index; // 수정 중인 인덱스 설정
                    });
                  },
                  onSaveEditProject: (index, newTitle) {
                    // 저장 버튼을 눌렀을 때
                    setState(() {
                      manager.octopus[index].title = newTitle; // 새로운 제목 저장
                      editingIndex = null; // 수정 모드 종료
                    });
                    saveProjectsToCache(); // 캐시에 저장
                  },
                  onDeleteProject: deleteProject,
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
                  editingIndex: editingIndex, // 편집 중인 인덱스 전달
                  editTextController: _editTextController, // 컨트롤러 전달
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            name: "slip/ss",
                            koreanName: "빼뜨기",
                          ),
                          SizedBox(width: 10),
                          Button(name: "ch", koreanName: "사슬뜨기"),
                          SizedBox(width: 10),
                          Button(name: "sc", koreanName: "짧은 뜨기"),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(name: "half-double", koreanName: "긴뜨기"),
                          SizedBox(width: 10),
                          Button(name: "double", koreanName: "한길 긴뜨기"),
                          SizedBox(width: 10),
                          Button(name: "treble(tc)", koreanName: "두길 긴뜨기"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "그냥 운에 맡기기",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Roulette(controller: _controller),
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
      ),
    );
  }
}
