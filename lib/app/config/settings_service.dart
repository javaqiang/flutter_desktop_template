import 'dart:developer';
import 'package:get/get.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    await _initEnv();

    log('$runtimeType ready!');
    return this;
  }

  ///初始化
  _initEnv() async {}
}
