import 'package:flutter_desktop_template/app/api/apis.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    LogWriterCallback log = defaultLogWriterCallback;
    httpClient.baseUrl = SERVER_API_URL;

    // 请求拦截
    httpClient.addRequestModifier<void>((request) {
      request.headers['content-type'] = 'application/json';
      request.headers.remove('content-length');
      request.headers['accept'] = '*/*';

      log('Request ${request.url.path}');
      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      log('Response ${response.bodyString}');
      var data = response.body;
      String? statusText = response.statusText;
      int? statusCode = response.statusCode;

      //统一处理错误
      if (data != null && (data is Map) && data['code'] != 0) {
        statusText = data['msg'];
        statusCode = data['code'];
      }

      if (data != null && (data is Map) && data['data'] != null) {
        data = data['data'];
      }

      if (statusCode == 501) {
        // LoginService loginService = Get.find();
        // statusText = '';
        // loginService.login();
      }

      return Response(
        statusCode: statusCode,
        statusText: statusText,
        body: data,
      );
    });
  }

  /// default logger from GetX
  void defaultLogWriterCallback(String value, {bool isError = false}) {
    if (isError || Get.isLogEnable) developer.log(value, name: 'HTTP');
  }

  Future<Response> upload(file, String filename) async {
    final form = FormData({
      'file': MultipartFile(file,
          filename: filename, contentType: 'multipart/form-data'),
    });

    return await post(UPLOAD, form);
  }
}
