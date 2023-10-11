import 'package:flutter/material.dart';
import 'package:praktikum/utils/utils.dart';
import 'package:praktikum/components/components.dart';
import 'package:praktikum/widgets/widgets.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    'Hello, Lisa 👋🏻',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Palette.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
                child: const Text(
                  'What do you wanna donate today?',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Palette.lightColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Palette.lightColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  suffixIcon: const Icon(Icons.tune_outlined),
                  suffixIconColor: Palette.primaryColor,
                  hintText: 'Looking for something?',
                  filled: true,
                  fillColor: Palette.lightColor)),
        ),
        const HeroWidget(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: const Text(
            'Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const CategoryWidget(),
        const SectionTitle(title: 'Campaigns'),
        const CampaignWidget(),
        const SectionTitle(title: 'Events'),
        const EventWidget(),
      ],
    );
  }
}
