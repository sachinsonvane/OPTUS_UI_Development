import 'package:flutter/cupertino.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/model/UserInfo.dart';
import 'package:optusdemo/repo/Repositorys.dart';

import '../api/ApiResponses.dart';

class StageDetailsViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  StageInfo? _stageInfo;

  ApiResponse get response {
    return _apiResponse;
  }

  StageInfo? get stageInfo {
    return _stageInfo;
  }

  /// Call the stageInfo service and gets the data of requested media data of

  Future<void> fetchStageDetailsData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching login data');
    notifyListeners();
    try {
      StageInfo stageInfo = await Repositorys().fetchStageDetailsData(value);
      _apiResponse = ApiResponse.completed(stageInfo);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedStageDetailsInfo(StageInfo? stageInfo) {
    _stageInfo = stageInfo;
    notifyListeners();
  }
}