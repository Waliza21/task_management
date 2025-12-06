import 'package:flutter/material.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        spacing: 12,
        children: [
          CircleAvatar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rahim Hasan',
                style: textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
              Text(
                'rahim@gmail.com',
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //apbbar ke widget banate chaile ei jinishta add kora lage,as preferredsizewidget ke inherit kora lage,r preferredsizewidget er ei property ta define kore deya lagbe. preferredsizewidget is an abstract class.
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
