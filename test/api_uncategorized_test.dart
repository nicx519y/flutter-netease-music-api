import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  // PersistCookieJar 会存储cookie，登录完成后可以将doSetUp置为false,
  // TODO 登录接口需要验证本地是否登录只类的场景，不需要每次都去调用
  const bool doSetUp = false;

  setUp(() async {
    if (!doSetUp) return;
    try {
      var result = await api.loginCellPhone(login_phone, login_phone_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
      result = await api.loginEmail(login_email, login_email_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
    } catch (e) {
      //前置条件允许出错
    }
  });

  test('test home bannerList', () async {
    var result = await api.homeBannerList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized private content', () async {
    var result = await api.personalizedPrivateContent();
    expect(result.code, RET_CODE_OK);
  });
}
