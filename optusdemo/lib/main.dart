import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optusdemo/view/DashboardPage.dart';
import 'package:optusdemo/view/LoginPage.dart';
import 'package:optusdemo/viewmodel/DashboardViewModel.dart';
import 'package:optusdemo/viewmodel/LoginViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginViewModel()),
        ChangeNotifierProvider.value(value: DashboardViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
        },
      ),
    );
  }
}
