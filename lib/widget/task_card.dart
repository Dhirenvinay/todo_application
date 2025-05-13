import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/task_provider.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Widget? trailing;

  const TaskCard({super.key, required this.task, this.trailing});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.read<TaskProvider>();
    final theme = Theme.of(context);
    final description = widget.task.description;
    final isLong =
        description.length > 100 || description.split('\n').length > 2;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.task.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration:
                      widget.task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  color: widget.task.isDone ? Colors.grey : Colors.black87,
                ),
              ),
            ),
          ],
        ),
        subtitle:
            description.isNotEmpty
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      maxLines: _expanded ? null : 2,
                      overflow:
                          _expanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            widget.task.isDone ? Colors.grey : Colors.black54,
                      ),
                    ),
                    if (isLong)
                      GestureDetector(
                        onTap: () => setState(() => _expanded = !_expanded),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            _expanded ? 'Show less' : 'Read more',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
                : null,
        value: widget.task.isDone,
        onChanged: (_) => taskProvider.toggleTaskDone(widget.task.id),
        controlAffinity: ListTileControlAffinity.leading,
        secondary: widget.trailing,
      ),
    );
  }
}
