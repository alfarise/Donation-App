import 'package:appwrite/appwrite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/firebase_options.dart';
import 'package:praktikum/notification_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  Client client = Client();
  client
      .setEndpoint('http://localhost/v1')
      .setProject('6565b36bbdccb3e69b19')
      .setSelfSigned(status: true);
  // For self signed certificates, only use for development
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final RxBool isLoggedIn = false.obs;

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = await _prefs.containsKey('user_token');
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus();
    return GetMaterialApp(
      title: 'Donation App',
      initialRoute: isLoggedIn.value ? AppPages.DASHBOARD : AppPages.INITIAL,
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
