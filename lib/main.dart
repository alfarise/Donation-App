import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum/pages/pages.dart';
import 'package:praktikum/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return MaterialApp(
      title: 'Donation App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryColor),
          useMaterial3: true,
          fontFamily: 'Metropolis',
          primaryColor: Palette.primaryColor,
          scaffoldBackgroundColor: Palette.secondaryColor),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
