import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/app/modules/views.dart';

import '../controllers/dashboard_controller.dart';
import 'widgets/widgets.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavbarWidget(),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: const <Widget>[
              HomeView(),
              SavedView(),
              Center(
                child: Text('Still process!'),
              ),
              Center(
                child: Text('Still process!'),
              ),
            ],
          )),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
