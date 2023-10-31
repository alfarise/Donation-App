import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers.dart';
import '../components/components.dart';

class NewsWidget extends GetView<DashboardController> {
  const NewsWidget({super.key});

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

            if (article.urlToImage != null) {
              imagePath = NetworkImage(article.urlToImage);
            } else {
              imagePath = const AssetImage('assets/images/picture_2.jpg');
            }

            return CardCampaignComponent(
              title: article.title,
              description: article.description,
              image: imagePath,
            );
          },
        ),
      ),
    );
  }
}
