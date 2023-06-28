import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  const TaskCard({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getScreenWidth(context) * 0.7,
        height: getScreenWidth(context) * 0.15,
        child: Card(
          child: ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            title: Text(title),
            subtitle: Text(description),
          ),
        ),
    );
  }
}
