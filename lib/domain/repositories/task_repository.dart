import '../entities/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();
  void addTask(String title, String description);
  void toggleTaskDone(String id);
  void removeTask(String id);
  void reorderTasks(int oldIndex, int newIndex);
  int getCompletedCount();
}
