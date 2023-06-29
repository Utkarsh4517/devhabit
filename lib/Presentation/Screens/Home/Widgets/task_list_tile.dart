import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhabit/Data/task_class.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final String taskId;
  const TaskCard({
    required this.title,
    required this.description,
    required this.taskId,
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  void _toggleTaskCompletion(bool? value) {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    setState(() {
      isChecked = value!;
    });

    FirebaseFirestore.instance.collection('users').doc(userId).collection('tasks').doc(widget.taskId).update({'isCompleted': isChecked});
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getScreenWidth(context) * 0.7,
        height: getScreenWidth(context) * 0.15,
        child: Card(
          child: ListTile(
            leading: Checkbox(
              value: isChecked,
              onChanged: _toggleTaskCompletion,
            ),
            title: Text(widget.title),
            subtitle: Text(widget.description),
          ),
        ),

    );
  }
}
