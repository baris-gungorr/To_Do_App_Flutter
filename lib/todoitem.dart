import 'package:flutter/material.dart';
import 'package:todoapp/constans/tasktype.dart';
import 'package:todoapp/modell/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.task.isCompleted ? Colors.grey : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.task.type == TaskType.note
                  ? Image.asset("lib/assets/images/category_1.png")
                  : widget.task.type == TaskType.contest
                      ? Image.asset("lib/assets/images/category_3.png")
                      : Image.asset("lib/assets/images/category_2.png"),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.task.title,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      widget.task.description,
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
              Checkbox(
                  value: isChecked,
                  onChanged: (val) => {
                        setState(() {
                          widget.task.isCompleted = !widget.task.isCompleted;
                        })
                      })
            ],
          ),
        ));
  }
}
