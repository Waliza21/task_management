import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/new_task_list_screen.dart';
import 'package:task_management/ui/screens/progress_task_list_screen.dart';
import 'package:task_management/ui/widgets/tm_app_bar.dart';

class MainBottomNavHolderScreen extends StatefulWidget {
  const MainBottomNavHolderScreen({super.key});

  static const String name = '/main-bottom-nav-holder';

  @override
  State<MainBottomNavHolderScreen> createState() =>
      _MainBottomNavHolderScreenState();
}

class _MainBottomNavHolderScreenState extends State<MainBottomNavHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NewTaskListScreen(),
    ProgressTaskListScreen(),
    NewTaskListScreen(),
    NewTaskListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          //ekhane shudhu icon er color change hoy, r bottomnavigationbar e purata tab er color change hoy.
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Cancelled',
          ),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
    );
  }
}

//preferred size widget mane holo je eta appbar er moto ekta widget jeta specific height nibe, preferredsizewidget er implement na hole appbar hishebe chintesilo na.
