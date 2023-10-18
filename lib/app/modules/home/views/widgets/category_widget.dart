import 'package:flutter/material.dart';
import 'package:praktikum/core/core.dart';

import '../components/components.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 109,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardIconComponent(
              title: 'All', icon: Icons.widgets, color: Palette.category1),
          CardIconComponent(
              title: 'Campaigns',
              icon: Icons.campaign,
              color: Palette.category2),
          CardIconComponent(
              title: 'Donate Goods',
              icon: Icons.shopping_bag,
              color: Palette.category3),
          CardIconComponent(
              title: 'Charity',
              icon: Icons.paid_outlined,
              color: Palette.category4),
          CardIconComponent(
              title: 'Events',
              icon: Icons.event_available,
              color: Palette.category5),
        ],
      ),
    );
  }
}
