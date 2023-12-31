import 'package:flutter/material.dart';

import '../components/components.dart';

class SavedWidget extends StatelessWidget {
  const SavedWidget({super.key, required this.posts});

  final List<dynamic> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      width: double.infinity,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];
          return CardSavedComponent(
            title: post.title,
            description: post.body,
            image: const AssetImage('assets/images/picture_2.jpg'),
          );
        },
      ),
    );
  }
}

/* istView(
  scrollDirection: Axis.vertical,
  children: const <Widget>[
    CardSavedComponent(
      title: 'More Campaign',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      image: AssetImage('assets/images/picture_2.jpg'),
    ),
    CardSavedComponent(
      title: 'More Campaign',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      image: AssetImage('assets/images/picture_2.jpg'),
    ),
    CardSavedComponent(
      title: 'More Campaign',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      image: AssetImage('assets/images/picture_2.jpg'),
    ),
  ],
) */
