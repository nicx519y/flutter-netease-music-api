import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api/list/api.dart';
import 'dio_ext.dart';
import 'netease_handler.dart';

class NeteaseMusicApi with ApiPlayList {
  static NeteaseMusicApi _musicApi;

  NeteaseMusicApi._internal() {
    Https.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
      neteaseInterceptor(option);
    }));
  }

  factory NeteaseMusicApi() {
    return _musicApi ??= NeteaseMusicApi._internal();
  }

  Future<String> homeBannerList() {
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: {"clientType": "pc"},
            options: joinOptions(hookRequestDate: true))
        .then((Response value) {
      debugPrint('$TAG   homeBannerList response ${value.data}');
      return value.data;
    });
  }
}
