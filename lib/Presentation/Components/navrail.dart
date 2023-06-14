import 'package:devhabit/Presentation/Screens/Home/UI/home_page.dart';
import 'package:devhabit/Presentation/Screens/Learnings/UI/learning_page.dart';
import 'package:devhabit/Presentation/Screens/Notes/UI/notes_page.dart';
import 'package:devhabit/Presentation/Screens/Stats/UI/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;



  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.house),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.noteSticky),
                label: Text('Notes'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.book),
                label: Text('Learning'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.stackExchange),
                label: Text('Stats'),
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const <Widget>[
                HomePage(
                  key: PageStorageKey('Page1'),
                ),
                NotesPage(
                  key: PageStorageKey('Page2'),
                ),
                LearningPage(
                  key: PageStorageKey('Page3'),
                ),
                StatsPage(
                  key: PageStorageKey('Page4'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
