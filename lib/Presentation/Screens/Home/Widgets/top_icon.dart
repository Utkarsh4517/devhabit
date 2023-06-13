import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';

class HomePageTopIcon extends StatelessWidget {
  final IconData icon;
  const HomePageTopIcon({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getScreenWidth(context) * 0.1),
        color: lightGreyColor,
        
      ),
      margin: EdgeInsets.all(
        getScreenWidth(context) * 0.01,
      ),
      padding: EdgeInsets.all(getScreenWidth(context) * 0.015),
      child: Icon(
        icon,
        color: blackColor,
      ),
    );
  }
}
