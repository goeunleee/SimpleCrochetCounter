import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project.dart';

class ProjectList extends StatelessWidget {
  final List<Project> projects;
  final Function(int) onSelectProject;
  final Function(int) onStartEditingProject; // 수정 시작 함수
  final Function(int, String) onSaveEditProject; // 저장 함수
  final Function(int) onDeleteProject;
  final VoidCallback onAddProject;
  final int? editingIndex;
  final TextEditingController editTextController;

  const ProjectList({
    super.key,
    required this.projects,
    required this.onSelectProject,
    required this.onStartEditingProject, // 수정 시작 함수 추가
    required this.onSaveEditProject, // 저장 함수 추가
    required this.onDeleteProject,
    required this.onAddProject,
    this.editingIndex,
    required this.editTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.octopusDeploy),
            Text(
              "나의 문어발",
              style: TextStyle(fontSize: 20),
            ),
            FaIcon(FontAwesomeIcons.octopusDeploy),
          ],
        ),
        projects.isEmpty
            ? const Column(
                children: [
                  SizedBox(height: 50),
                  Text("저장된 프로젝트가 없습니다"),
                ],
              )
            : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      final isEditing = editingIndex == index;

                      return ListTile(
                        title: isEditing
                            ? TextField(
                                controller: editTextController,
                                autofocus: true,
                                onSubmitted: (newTitle) {
                                  onSaveEditProject(
                                      index, newTitle); // 제목 수정 후 저장
                                },
                              )
                            : Text(project.title),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isEditing
                                ? IconButton(
                                    icon: const Icon(Icons.save),
                                    onPressed: () {
                                      onSaveEditProject(
                                          index, editTextController.text); // 저장
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      editTextController.text = project.title;
                                      onStartEditingProject(index); // 수정 모드로 전환
                                    },
                                  ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => onDeleteProject(index),
                            ),
                          ],
                        ),
                        onTap: () => onSelectProject(index),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  if (projects.length < 5)
                    ElevatedButton(
                      onPressed: onAddProject,
                      child: const Text("문어발 추가"),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            "*문어발은 8개*지만",
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "여기서는 **5개** 까지만 추가할 수 있어요",
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
      ],
    );
  }
}
