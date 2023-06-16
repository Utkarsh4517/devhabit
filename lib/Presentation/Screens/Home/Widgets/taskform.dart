import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const TaskForm({
    required this.hintText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.08).copyWith(top: getScreenWidth(context) * 0.08),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: blackColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20)),
            hintText: hintText),
      ),
    );
  }
}
