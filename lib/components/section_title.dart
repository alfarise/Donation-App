import 'package:flutter/material.dart';
import 'package:praktikum/utils/utils.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: <Widget>[
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 16, color: Palette.primaryColor),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.east, color: Palette.primaryColor)
                ],
              ),
            )
          ]),
    );
  }
}
