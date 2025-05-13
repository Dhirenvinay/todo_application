import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskProvider with ChangeNotifier {
  final TaskRepository _taskRepository;

  TaskProvider(this._taskRepository);

  List<Task> get tasks => _taskRepository.getTasks();

  int get completedCount => _taskRepository.getCompletedCount();

  void addTask(String title, String description) {
    _taskRepository.addTask(title, description);
    notifyListeners();
  }

  void toggleTaskDone(String id) {
    _taskRepository.toggleTaskDone(id);
    notifyListeners();
  }

  void removeTask(String id) {
    _taskRepository.removeTask(id);
    notifyListeners();
  }

  void reorderTasks(int oldIndex, int newIndex) {
    _taskRepository.reorderTasks(oldIndex, newIndex);
    notifyListeners();
  }
}
