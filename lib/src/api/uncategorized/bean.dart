import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class BannerItem {
  String bannerId;

  String pic;

  int targetId;
  int targetType;

  String titleColor;
  String typeTitle;
  String url;
  String adurlV2;

  bool exclusive;

  String encodeId;

  Song2 song;

  String alg;
  String scm;
  String requestId;

  bool showAdTag;

  BannerItem();

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}

@JsonSerializable()
class BannerListWrap extends ServerStatusBean {
  List<BannerItem> banners;

  BannerListWrap();

  factory BannerListWrap.fromJson(Map<String, dynamic> json) =>
      _$BannerListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListWrapToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentItem {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String name;
  String picUrl;
  String sPicUrl;
  String copywriter;

  String alg;

  int type;

  PersonalizedPrivateContentItem();

  factory PersonalizedPrivateContentItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedPrivateContentItemToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentListWrap extends ServerStatusBean {
  List<PersonalizedPrivateContentItem> result;

  PersonalizedPrivateContentListWrap();

  factory PersonalizedPrivateContentListWrap.fromJson(
          Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentListWrapFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalizedPrivateContentListWrapToJson(this);
}
