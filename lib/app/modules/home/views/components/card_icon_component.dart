import 'package:flutter/material.dart';

class CardIconComponent extends StatelessWidget {
  const CardIconComponent(
      {super.key,
      required this.title,
      required this.icon,
      required this.color});

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.withOpacity(0.2),
            ),
            child: Icon(
              icon,
              size: 45,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
