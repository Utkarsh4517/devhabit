import 'package:devhabit/Presentation/Screens/Home/UI/home_page.dart';
import 'package:flutter/material.dart';

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedInded = 0;

  // list of widgets to scroll
  final List<Widget> _pages = const [
    HomePage(
      key: PageStorageKey('Page1'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
