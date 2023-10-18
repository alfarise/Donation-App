import 'package:flutter/material.dart';
import 'package:praktikum/core/core.dart';

typedef NavigateView = Function();

class SectionTitleComponent extends StatelessWidget {
  const SectionTitleComponent({
    super.key,
    required this.title,
    required this.navigateView,
  });

  final String title;
  final NavigateView navigateView;

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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              navigateView();
            },
            child: const Row(
              children: <Widget>[
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16,
                    color: Palette.primaryColor,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.east,
                  color: Palette.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
