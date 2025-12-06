import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/add_new_task_screen.dart';
import 'package:task_management/ui/widgets/task_card.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            SizedBox(),
            _buildTaskSummaryListView(),
            ListView.separated(
              itemCount: 10,
              primary:
                  false, //uporer ta shoho scroll koranor jonno oitate singlechildscrollable disi and etake primary theke remove kore disi.
              shrinkWrap:
                  true, //It controls how the widget determines its size along its scrolling axis.
              itemBuilder: (context, index) {
                return TaskCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }

  Widget _buildTaskSummaryListView() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: Colors.white,
            margin: EdgeInsets.only(left: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Text('12', style: TextTheme.of(context).titleMedium),
                  Text('New', style: TextTheme.of(context).labelSmall),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
