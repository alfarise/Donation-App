import 'package:flutter/material.dart';

import '../components/components.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({super.key});

  @override
  State<StatefulWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  List<CardEventComponent> events = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 5; i++) {
      events.add(
        const CardEventComponent(
          time: 'Wednesday 9 AM',
          title: 'More Campaign',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: events,
      ),
    );
  }
}
