

import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/widgets/StageInfoListWidget.dart';

import 'package:provider/provider.dart';

import '../api/ApiResponses.dart';
import '../model/UserInfo.dart';
import '../viewmodel/DashboardViewModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {


  Widget getLoginWidget(BuildContext context, ApiResponse apiResponse) {

    // fro fetch live data
    UserInfo? userInfo = apiResponse.data as UserInfo?;

    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container()
              ),
            ),
          ],
        );
      case Status.ERROR:
        return Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return Center(
          child: Text('Stages data not found!'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    ApiResponse apiResponse = Provider.of<DashboardViewModel>(context).response;
    return Scaffold(

      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: null
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: getLoginWidget(context, apiResponse)),
            ],
          ),
    );
  }

  Future<void> _pullRefresh() async {

    print("_pullRefresh called");

  }
}

