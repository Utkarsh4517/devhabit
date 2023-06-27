import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:devhabit/Data/task_class.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Components/labels.dart';
import 'package:devhabit/Presentation/Screens/Home/Widgets/date_text.dart';
import 'package:devhabit/Presentation/Screens/Home/Widgets/taskform.dart';
import 'package:devhabit/Presentation/Screens/Profile/UI/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  Time _time = Time(hour: 11, minute: 30, second: 20);
  User? user = FirebaseAuth.instance.currentUser;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  // text editing controllers

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // method to add new task to the database
  Future<CollectionReference> addTask(Task task) async {
    final collection = FirebaseFirestore.instance
        .collection('users')
        .doc(task.userId)
        .collection('tasks');

    return collection
      ..add({
        'title': task.title,
        'description': task.description,
      });
  }

  // method to submit new task
  void submitTask() {
    String title = titleController.text;
    String description = descriptionController.text;
    Task newTask = Task(
      description: description,
      title: title,
      userId: FirebaseAuth.instance.currentUser!.uid,
      taskId: '',
    );

    addTask(newTask);
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String date = "${today.day}";
    int dateInt = today.day;
    int monthInt = today.month;
    int yearInt = today.year;

    DateFormat formatter = DateFormat.MMMM('en');
    String month = formatter.format(today);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getScreenheight(context) * 0.1,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'devhabit.',
              style: GoogleFonts.leagueSpartan(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(context) * 0.08),
            )),
        actions: [
          Container(
            margin: EdgeInsets.only(right: getScreenWidth(context) * 0.03),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              icon: const Icon(
                FeatherIcons.user,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: getScreenWidth(context) * 0.5,
              margin: EdgeInsets.only(left: getScreenWidth(context) * 0.035),
              child: Row(
                children: [
                  DateText(text: '$date - '),
                  DateText(text: month),
                ],
              ),
            ),
          ],
        ),
      ),

      // add task
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: whiteColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              width: getScreenWidth(context) * 0.9,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  // text form field which contains the task
                  TaskForm(
                      controller: titleController,
                      hintText: 'Task title',
                      icon: FeatherIcons.bookmark),

                  // text form field which contains the description
                  TaskForm(
                      controller: descriptionController,
                      hintText: 'Task description',
                      icon: FeatherIcons.book),
                  // calender section
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BottomPicker.dateTime(
                            title: 'Set the date and time for the task',
                            titleStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.04,
                              color: blackColor,
                            ),
                            onSubmit: (date) {},
                            onClose: () {},
                            iconColor: whiteColor,
                            minDateTime:
                                DateTime(yearInt, monthInt, dateInt - 1),
                            maxDateTime: DateTime(2024, 12, 31),
                            initialDateTime:
                                DateTime(yearInt, monthInt, dateInt),
                          ).show(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(context) * 0.1,
                          ).copyWith(top: getScreenWidth(context) * 0.05),
                          width: getScreenWidth(context) * 0.8,
                          height: getScreenWidth(context) * 0.12,
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: getScreenWidth(context) * 0.03,
                                  right: getScreenWidth(context) * 0.18,
                                ),
                                child: const Icon(
                                  FeatherIcons.calendar,
                                ),
                              ),
                              const Text(
                                'Select Date & Time',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.05,
                    ).copyWith(
                      top: getScreenWidth(context) * 0.03,
                    ),
                    child: const Wrap(
                      children: [
                        LabelChip(color: pink, text: 'Important'),
                        LabelChip(color: blue, text: 'Study'),
                        LabelChip(color: lightPurple, text: 'DSA'),
                        LabelChip(color: pink, text: 'Web D'),
                        LabelChip(color: blue, text: 'Study'),
                        LabelChip(color: lightPurple, text: 'Development'),
                      ],
                    ),
                  ),

                  // Add task button
                  SizedBox(
                    width: getScreenWidth(context) * 0.8,
                    height: getScreenWidth(context) * 0.13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        submitTask();
                      },
                      child: Text(
                        'Add Task',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, color: blackColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
        child: const Icon(
          FeatherIcons.plus,
          color: blackColor,
        ),
      ),
    );
  }
}
