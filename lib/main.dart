import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/presentation/task_list_screen.dart';
import 'package:todo/presentation/task_provider.dart';
import 'data/repositories/task_repository_impl.dart';

void main() {
  final taskRepository = TaskRepositoryImpl();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(taskRepository),
      child: const TaskApp(),
    ),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  static const Color primaryColor = Colors.teal;
  // static const Color lightColor = Color(0xFFE3E6FA); // light variant
  static const Color onPrimaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme(
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: primaryColor,
          surface: Colors.white,
          onSurface: Colors.black,
          // background: Colors.white,
          // onBackground: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: onPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardTheme(
          // elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: Colors.grey.shade500),

          // fillColor: WidgetStateProperty.all(primaryColor),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const TaskListScreen(),
    );
  }
}
