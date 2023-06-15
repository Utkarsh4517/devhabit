import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Screens/Home/UI/home_page.dart';
import 'package:devhabit/Presentation/Screens/Learnings/UI/learning_page.dart';
import 'package:devhabit/Presentation/Screens/Notes/UI/notes_page.dart';
import 'package:devhabit/Presentation/Screens/Stats/UI/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
            // settings icon.
            trailing: Column(
              children: [
                SizedBox(height: getScreenheight(context) * 0.54),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FeatherIcons.settings),
                ),
              ],
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Container(
                  width: getScreenWidth(context) * 0.1,
                  height: getScreenWidth(context) * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: const Icon(FeatherIcons.home),
                ),
                label: const Text('Home'),
              ),
              NavigationRailDestination(
                icon: Container(
                  width: getScreenWidth(context) * 0.1,
                  height: getScreenWidth(context) * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: const Icon(FeatherIcons.book),
                ),
                label: const Text('Notes'),
              ),
              NavigationRailDestination(
                icon: Container(
                  width: getScreenWidth(context) * 0.1,
                  height: getScreenWidth(context) * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: const Icon(FeatherIcons.grid),
                ),
                label: const Text('Learning'),
              ),
              NavigationRailDestination(
                icon: Container(
                  width: getScreenWidth(context) * 0.1,
                  height: getScreenWidth(context) * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: const Icon(FeatherIcons.pieChart),
                ),
                label: const Text('Stats'),
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
