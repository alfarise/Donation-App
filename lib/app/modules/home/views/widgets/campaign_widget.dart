import 'package:flutter/material.dart';

import '../components/components.dart';

class CampaignWidget extends StatelessWidget {
  const CampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 321,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardCampaignComponent(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_2.jpg'),
          ),
          CardCampaignComponent(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_3.jpg'),
          ),
          CardCampaignComponent(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_4.jpg'),
          ),
        ],
      ),
    );
  }
}
