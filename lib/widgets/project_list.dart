// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                editTextController.text = project.title;
                                onStartEditingProject(index);
                              },
                              backgroundColor: const Color(0xFF0392CF),
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                            SlidableAction(
                              onPressed: (context) => onDeleteProject(index),
                              backgroundColor: const Color(0xFFFE4A49),
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: isEditing
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: editTextController,
                                        autofocus: true,
                                        onSubmitted: (newTitle) {
                                          onSaveEditProject(index, newTitle);
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.save),
                                      onPressed: () {
                                        onSaveEditProject(
                                            index, editTextController.text);
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05, // 화면 너비의 5%
                                      ),
                                      child: Text(
                                        project.title,
                                      ),
                                    ),
                                    const Icon(Icons.keyboard_double_arrow_left)
                                  ],
                                ),
                          onTap: () => onSelectProject(index), // 프로젝트 선택
                        ),
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
