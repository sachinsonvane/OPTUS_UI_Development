
import 'package:optusdemo/api/MyServices.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/model/UserInfo.dart';

import '../api/BaseService.dart';

class Repositorys {

  BaseService _mediaService = MyService();

  Future<List<StageInfo>> fetchStageInfoList(String value) async {

    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    List<StageInfo> mediaList =
    jsonData.map((tagJson) => StageInfo.fromJson(tagJson)).toList();
    return mediaList;

  }

  Future<UserInfo> fetchUserInfo(String value) async {

    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as dynamic;
    UserInfo userInfo =
    jsonData.map((tagJson) => UserInfo.fromJson(tagJson)).toList();
    return userInfo;

  }
}