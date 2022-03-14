
import 'package:optusdemo/api/MyServices.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/model/UserInfo.dart';

import '../api/BaseService.dart';

class Repositorys {

  BaseService _stageService = MyService();

  Future<List<StageInfo>> fetchStageInfoList(String value) async {

    dynamic response = await _stageService.getResponse(value);
    final jsonData = response['results'] as List;
    List<StageInfo> stageInfoList = jsonData.map((tagJson) => StageInfo.fromJson(tagJson)).toList();
    return stageInfoList;

  }

  Future<UserInfo> fetchLoginData(String value) async {

    dynamic response = await _stageService.getResponse(value);
    final jsonData = response['results'] as dynamic;
    UserInfo userInfo =
    jsonData.map((tagJson) => UserInfo.fromJson(tagJson));
    return userInfo;

  }



}