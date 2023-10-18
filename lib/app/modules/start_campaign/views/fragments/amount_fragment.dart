import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/start_campaign_controller.dart';

class AmountFragment extends GetView<StartCampaignController> {
  const AmountFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Fundraiser Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'How much would you like to raise?',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.lightColor),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Palette.lightColor),
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Palette.lightColor,
            hintText: '\$ Enter Amount',
            suffixIcon: const Icon(Icons.attach_money_outlined),
            suffixIconColor: Palette.primaryColor,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: controller.amountController,
        ),
        const SizedBox(height: 18),
        // TextField(
        //   decoration: InputDecoration(
        //     enabledBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Palette.lightColor),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Palette.lightColor),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     filled: true,
        //     fillColor: Palette.lightColor,
        //     hintText: 'Chose Category',
        //   ),
        // ),
        // const SizedBox(height: 18),
        // TextField(
        //   decoration: InputDecoration(
        //     enabledBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Palette.lightColor),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Palette.lightColor),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     filled: true,
        //     fillColor: Palette.lightColor,
        //     hintText: 'Enter Your Location',
        //     suffixIcon: const Icon(Icons.location_on_outlined),
        //     suffixIconColor: Palette.primaryColor,
        //   ),
        // ),
      ],
    );
  }
}
