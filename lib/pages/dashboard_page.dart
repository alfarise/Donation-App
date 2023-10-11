import 'package:flutter/material.dart';
import 'package:praktikum/fragments/fragments.dart';
import 'package:praktikum/widgets/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavbarWidget(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          HomeFragment(),
          ConstructionFragment(),
        ],
      ),
      bottomNavigationBar: BottomNavbarWidget(onIndexChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
    );
  }
}
