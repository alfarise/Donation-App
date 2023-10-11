import 'package:flutter/material.dart';
import 'package:praktikum/utils/utils.dart';

class CardCampaign extends StatelessWidget {
  const CardCampaign(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  final String title;
  final String description;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(right: 16),
      width: 343,
      decoration: BoxDecoration(
          color: Palette.lightColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, right: 8),
                decoration: BoxDecoration(
                    color: Palette.lightColor,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_rounded),
                  color: Palette.primaryColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                color: Palette.darkColor,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
          const Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Goals: \$5.000',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                'Raised of \$2.000 (60%)',
                style: TextStyle(
                    color: Palette.primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
