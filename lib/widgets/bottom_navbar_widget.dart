import 'package:flutter/material.dart';
import 'package:praktikum/utils/utils.dart';

typedef ChangeIndexCallback = Function(int index);

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key, required this.onIndexChange});

  final ChangeIndexCallback onIndexChange;

  @override
  State<StatefulWidget> createState() => _BottomNavbarWidget();
}

class _BottomNavbarWidget extends State<BottomNavbarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // print(widget.)
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(color: Palette.primaryColor),
      selectedItemColor: Palette.primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          widget.onIndexChange(index);
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
