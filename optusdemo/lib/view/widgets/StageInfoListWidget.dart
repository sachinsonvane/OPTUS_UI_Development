import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/StageDetailsPage.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/DashboardViewModel.dart';

class StageInfoListWidget extends StatefulWidget {

  final List<StageInfo> _stageInfoList;
  final Function _function;

  StageInfoListWidget(this._stageInfoList, this._function);

  @override
  _StageInfoListWidgetState createState() => _StageInfoListWidgetState();
}

class _StageInfoListWidgetState extends State<StageInfoListWidget> {

  Widget _buildSongItem(StageInfo stageInfo) {

    StageInfo? _selectedStageInfo = Provider.of<DashboardViewModel>(context).stageInfo;

    String isParent = stageInfo.isParent ?? '';

    if(isParent == "1"){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.water_damage_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      stageInfo.title ?? '',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      stageInfo.subTitle ?? '',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      stageInfo.desc ?? '',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
            if (_selectedStageInfo != null &&
                _selectedStageInfo.title == stageInfo.title)
              Icon(
                Icons.visibility,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      stageInfo.title ?? '',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      stageInfo.subTitle ?? '',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      stageInfo.desc ?? '',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
            if (_selectedStageInfo != null &&
                _selectedStageInfo.title == stageInfo.title)
              Icon(
                Icons.visibility,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget._stageInfoList.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            StageInfo data = widget._stageInfoList[index];
            return InkWell(
              onTap: () {
                if (null != data.title) {
                  widget._function(data);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StageDetailsPage()),
                );
              },
              child: _buildSongItem(data),
            );
          },
        ),
      ]),
    );
  }
}