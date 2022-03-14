

import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/widgets/StageInfoListWidget.dart';

import 'package:provider/provider.dart';

import '../api/ApiResponses.dart';
import '../viewmodel/DashboardViewModel.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {

  List<StageInfo> getStaticData(){

    List<StageInfo> stageInfoList = [
      StageInfo(title: "Stage 1",subTitle: "Stage 1 sub title",desc: "Stage 1 description",startDate: "11-03-2022",endDate: "23-03-2022"),
      StageInfo(title: "Stage 2",subTitle: "Stage 2 sub title",desc: "Stage 2 description",startDate: "11-03-2022",endDate: "23-03-2022"),

    ];

    return stageInfoList;
  }

  Widget getStageInfoListWidget(BuildContext context, ApiResponse apiResponse) {

    // fro fetch live data
    //List<StageInfo>? stageInfoList = apiResponse.data as List<StageInfo>?;

    // for fetch static data
    List<StageInfo>? stageInfoList = getStaticData();
    apiResponse = ApiResponse.completed(stageInfoList);

    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: StageInfoListWidget(stageInfoList!, (StageInfo stageInfo) {
                Provider.of<DashboardViewModel>(context, listen: false)
                    .setSelectedStageInfo(stageInfo);
              }),
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
        title: Text('Dashboard'),
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
          Expanded(child: getStageInfoListWidget(context, apiResponse)),
        ],
      ),
    );
  }
}


/*
if (value.isNotEmpty) {
Provider.of<DashboardViewModel>(context, listen: false)
    .setSelectedStageInfo(null);
Provider.of<DashboardViewModel>(context, listen: false)
    .fetchStageInfoData(value);
}*/
