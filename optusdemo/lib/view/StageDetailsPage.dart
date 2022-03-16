

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/widgets/StageInfoListWidget.dart';

import 'package:provider/provider.dart';

import '../api/ApiResponses.dart';
import '../model/UserInfo.dart';
import '../viewmodel/DashboardViewModel.dart';
import '../viewmodel/LoginViewModel.dart';
import '../viewmodel/StageDetailsViewModel.dart';
import 'DashboardPage.dart';

class StageDetailsPage extends StatefulWidget {

  @override
  _StageDetailsPage createState() => _StageDetailsPage();
}

class _StageDetailsPage extends State<StageDetailsPage> {


  Widget _buildSongItem(StageInfo stageInfo) {

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(

          children: <Widget>[

            Row(
              children: [
                Text(
                  stageInfo.title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),


            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Text(
                  stageInfo.subTitle ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Text(
                  stageInfo.desc ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),


          ],
        ),
      );


  }

  @override
  Widget build(BuildContext context) {

    StageInfo? _selectedStageInfo = Provider.of<DashboardViewModel>(context).stageInfo;

    return Scaffold(

      appBar: AppBar(
        title: Text('Stage Details'),
      ),
      body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: _buildSongItem(_selectedStageInfo!),
                ),
              ),

              //  Expanded(child: getLoginWidget(context, apiResponse)),
            ],
          )),
    );
  }

  Future<void> _pullRefresh() async {

    print("_pullRefresh called");

  }
}

