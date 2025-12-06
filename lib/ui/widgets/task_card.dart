import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        tileColor: Colors.white,
    
        title: Text('Title of task'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description of the task',
              style: TextStyle(color: Colors.grey),
            ),
            Text('Date: 12 June 2021'),
            SizedBox(height: 8),
            Row(
              children: [
                // Chip(
                //   label: Text(
                //     'New',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                //   backgroundColor: Colors.green,
                //   labelPadding: EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 0,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(), //shobkichuke dhakka diye dan dike niye ashbe
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
