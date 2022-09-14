import 'package:flutter_desktop_template/app/config/settings_service.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

LogWriterCallback log = defaultServiceLogWriterCallback;

/// 在你运行Flutter应用之前，让你的服务初始化是一个明智之举。
////因为你可以控制执行流程（也许你需要加载一些主题配置，apiKey，由用户自定义的语言等，所以在运行ApiService之前加载SettingService。
///所以GetMaterialApp()不需要重建，可以直接取值。
initServices() async {
  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  await Get.putAsync(() => SettingsService().init());

  log('initServices All services started');
}

/// default logger from INIT
void defaultServiceLogWriterCallback(String value, {bool isError = false}) {
  if (isError || Get.isLogEnable) developer.log(value, name: 'INIT');
}
