import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Screens/Notes/style/notes_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void getCheckValue() async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    final taskSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(widget.taskId) // Replace taskId with the appropriate variable
        .get();

    setState(() {
      isChecked = taskSnapshot.data()?['isCompleted'] ?? false;
    });
  }

  void _toggleTaskCompletion(bool? value) {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    setState(() {
      isChecked = value!;
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(widget.taskId)
        .update({'isCompleted': isChecked});
  }

  Future<void> _deleteTask() async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;

    final collection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks');

    await collection.doc(widget.taskId).delete();
  }
  @override
  void initState() {
    getCheckValue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getScreenWidth(context) * 0.03),
      width: getScreenWidth(context) * 0.7,
      height: getScreenWidth(context) * 0.2,
      child: Card(
        color: lightGreyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              value: isChecked,
              onChanged: _toggleTaskCompletion,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: () {
                showDeleteTaskDialog();
              },
              icon: const Icon(
                FeatherIcons.trash2,
                color: Colors.red,
              ),
            ),
          ),
          title: Text(
            widget.title,
            style: AppStyle.mainTitle,
          ),
          subtitle: Text(
            widget.description,
            style: AppStyle.mainContent,
          ),
        ),
      ),
    );
  }

  showDeleteTaskDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: getScreenWidth(context) * 0.9,
              height: getScreenWidth(context) * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Expanded(
                child: Column(
                  children: [
                    Text(
                      'Are you sure want to delete this task?',
                      style: GoogleFonts.roboto(
                          fontSize: getScreenWidth(context) * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: getScreenWidth(context) * 0.035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No')),
                        TextButton(
                            onPressed: () {
                              _deleteTask();
                              Navigator.pop(context);
                            },
                            child: const Text('Yes')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showExpandedTaskDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
