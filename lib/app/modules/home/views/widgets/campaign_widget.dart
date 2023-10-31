import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers.dart';
import '../components/components.dart';

class CampaignWidget extends GetView<DashboardController> {
  const CampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 321,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.newsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var article = controller.newsList[index];
            final ImageProvider imagePath;
            print('Test:: $article');

            if (article['urlToImage'] != null) {
              imagePath = NetworkImage(article['urlToImage']);
            } else {
              imagePath = const AssetImage('assets/images/picture_2.jpg');
            }

            return CardCampaignComponent(
              title: article['title'],
              description: article['description'],
              image: imagePath,
            );
          },
        ),
      ),
    );
  }
}

// const <Widget>[
//   CardCampaignComponent(
//     title: 'More Campaign',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
//     image: AssetImage('assets/images/picture_2.jpg'),
//   ),
//   CardCampaignComponent(
//     title: 'More Campaign',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
//     image: AssetImage('assets/images/picture_3.jpg'),
//   ),
//   CardCampaignComponent(
//     title: 'More Campaign',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
//     image: AssetImage('assets/images/picture_4.jpg'),
//   ),
// ]