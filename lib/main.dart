import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:praktikum/core/core.dart';

import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Donation App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.primaryColor,
        ),
        useMaterial3: true,
        fontFamily: 'Metropolis',
        primaryColor: Palette.primaryColor,
        scaffoldBackgroundColor: Palette.secondaryColor,
      ),
    );
  }
}
