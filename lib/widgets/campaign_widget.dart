import 'package:flutter/material.dart';
import 'package:praktikum/components/components.dart';

class CampaignWidget extends StatelessWidget {
  const CampaignWidget({super.key});

  @override
  Widget build(Object context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 321,
      child:
          ListView(scrollDirection: Axis.horizontal, children: const <Widget>[
        CardCampaign(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_2.jpg')),
        CardCampaign(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_3.jpg')),
        CardCampaign(
            title: 'More Campaign',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
            image: AssetImage('assets/images/picture_4.jpg')),
      ]),
    );
  }
}
