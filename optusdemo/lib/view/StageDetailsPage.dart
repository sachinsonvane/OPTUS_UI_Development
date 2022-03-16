

import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/widgets/StageInfoListWidget.dart';

import 'package:provider/provider.dart';

import '../api/ApiResponses.dart';
import '../model/UserInfo.dart';
import '../viewmodel/DashboardViewModel.dart';
import '../viewmodel/LoginViewModel.dart';
import 'DashboardPage.dart';

class StageDetailsPage extends StatefulWidget {

  @override
  _StageDetailsPage createState() => _StageDetailsPage();
}

class _StageDetailsPage extends State<StageDetailsPage> {

  final _formKey = GlobalKey<FormState>();
  final mUserNameController = TextEditingController(text: "Sachin");
  final mPasswordController = TextEditingController(text: "12345");


  @override
  Widget build(BuildContext context) {

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[


                      ],
                    ),),
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

