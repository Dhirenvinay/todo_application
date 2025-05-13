import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  List<Task> getTasks() => _tasks;

  @override
  void addTask(String title, String description) {
    if (title.trim().isNotEmpty) {
      _tasks.add(
        Task(
          id: DateTime.now().toString(),
          title: title.trim(),
          description: description.trim(),
        ),
      );
    }
  }

  @override
  void toggleTaskDone(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = Task(
        id: _tasks[index].id,
        title: _tasks[index].title,
        description: _tasks[index].description,
        isDone: !_tasks[index].isDone,
      );
    }
  }

  @override
  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  @override
  int getCompletedCount() => _tasks.where((task) => task.isDone).length;

  @override
  void reorderTasks(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final task = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, task);
  }
}
