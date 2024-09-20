// project_manager.dart
import '../models/project.dart';

class ProjectManager {
  List<Project> octopus = [];

  void addProject(Project project) {
    if (octopus.length < 5) {
      octopus.add(project);
    } else {
      print('최대 5개의 프로젝트만 저장할 수 있어요');
    }
  }
}
