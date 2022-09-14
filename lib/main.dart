import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized().scheduleWarmUpFrame();
  runApp(
    GetMaterialApp(
      title: "Application",
      builder: BotToastInit(),
      initialRoute: AppPages.INITIAL,
      navigatorKey: Get.key,
      navigatorObservers: [BotToastNavigatorObserver()],
      getPages: AppPages.routes,
    ),
  );
}
