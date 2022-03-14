

import 'package:flutter/material.dart';
import 'package:optusdemo/model/StageInfo.dart';
import 'package:optusdemo/view/widgets/StageInfoListWidget.dart';

import 'package:provider/provider.dart';

import '../api/ApiResponses.dart';
import '../model/UserInfo.dart';
import '../viewmodel/DashboardViewModel.dart';
import 'DashboardPage.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final mUserNameController = TextEditingController(text: "Sachin");
  final mPasswordController = TextEditingController(text: "12345");

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
          child: Text(''),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    ApiResponse apiResponse = Provider.of<DashboardViewModel>(context).response;

    final emailField = TextFormField(
      obscureText: false,
      style: TextStyle(fontFamily: "Rubik",color: Colors.purple[800]),
      validator: (value) {
        //if (value.isEmpty) {
          return 'Please enter movie title';
       // }
        return null;
      },
      controller: mUserNameController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: TextStyle(fontFamily: "Rubik",color: Colors.purple[800]),
      validator: (value) {
        //if (value.isEmpty) {
          return 'Please enter password';
       // }
        return null;
      },
      controller: mPasswordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        child: MaterialButton(
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            //print("H1");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );

          },
          child: Text("Login",style: TextStyle(fontFamily: "Rubik",color: Colors.purple[400]),
            textAlign: TextAlign.center,
          ),
        ));

    return Scaffold(

      appBar: AppBar(
        title: Text('Login'),
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

                          SizedBox(height: 45.0),
                          emailField,
                          SizedBox(height: 25.0),
                          passwordField,
                          SizedBox(
                            height: 35.0,
                          ),
                          loginButon,
                          SizedBox(
                            height: 15.0,
                          ),

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

