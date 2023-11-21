import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/app/modules/views.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/dashboard_controller.dart';
import 'widgets/widgets.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbarWidget(),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const <Widget>[
            HomeView(),
            SavedView(),
            Center(
              child: Text('Still process!'),
            ),
            WebView(
              initialUrl: 'https://flutter.dev',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
