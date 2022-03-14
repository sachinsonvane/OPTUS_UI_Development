import 'package:flutter/cupertino.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/repo/Repositorys.dart';

import '../api/ApiResponses.dart';

class DashboardViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  StageInfo? _stageInfo;

  ApiResponse get response {
    return _apiResponse;
  }

  StageInfo? get stageInfo {
    return _stageInfo;
  }

  /// Call the stageInfo service and gets the data of requested media data of

  Future<void> fetchStageInfoData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List<StageInfo> stageInfoList = await Repositorys().fetchStageInfoList(value);
      _apiResponse = ApiResponse.completed(stageInfoList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedStageInfo(StageInfo? stageInfo) {
    _stageInfo = stageInfo;
    notifyListeners();
  }
}