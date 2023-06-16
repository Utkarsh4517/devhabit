import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';

class LabelChip extends StatefulWidget {
  final String text;
  final Color color;
  const LabelChip({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  State<LabelChip> createState() => _LabelChipState();
}

class _LabelChipState extends State<LabelChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context)* 0.02),
      child: Chip(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(widget.text),
      ),
    );
  }
}
