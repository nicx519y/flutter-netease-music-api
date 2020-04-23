import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/list/api.dart';
import 'api/login/api.dart';
import 'dio_ext.dart';
import 'netease_handler.dart';

class NeteaseMusicApi with ApiPlayList, ApiLogin {
  static bool _hasInit = false;
  static bool debug = false;

  NeteaseMusicApi._internal() {
    if (_hasInit) {
      return;
    }
    _hasInit = true;
    Https.dio.interceptors.add(CookieManager(CookieJar()));
    Https.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
      neteaseInterceptor(option);
    }));
    if (debug) {
      Https.dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  factory NeteaseMusicApi() {
    return NeteaseMusicApi._internal();
  }

  Future<String> homeBannerList() {
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: {'clientType': 'pc'},
            options: joinOptions(hookRequestDate: true))
        .then((Response value) {
      return value.data;
    });
  }
}
