import 'package:flutter/cupertino.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/model/UserInfo.dart';
import 'package:optusdemo/repo/Repositorys.dart';

import '../api/ApiResponses.dart';

class LoginViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  UserInfo? _userInfo;

  ApiResponse get response {
    return _apiResponse;
  }

  UserInfo? get userInfo {
    return _userInfo;
  }

  /// Call the stageInfo service and gets the data of requested media data of

  Future<void> fetchLoginData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching login data');
    notifyListeners();
    try {
      UserInfo userInfo = await Repositorys().fetchLoginData(value);
      _apiResponse = ApiResponse.completed(userInfo);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedUserInfo(UserInfo? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}