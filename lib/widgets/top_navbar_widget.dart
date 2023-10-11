import 'package:flutter/material.dart';
import 'package:praktikum/utils/utils.dart';

class TopNavbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const TopNavbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _TopWidgetNavbarWidget();
}

class _TopWidgetNavbarWidget extends State<TopNavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Menu Icon')));
        },
      ),
      backgroundColor: Palette.secondaryColor,
      scrolledUnderElevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification Icon')));
          },
        ),
        Container(
          width: 28,
          height: 28,
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/user.jpg'),
                  fit: BoxFit.fill)),
        ),
      ],
    );
  }
}
