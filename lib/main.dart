import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/Mythems.dart';
import 'package:myfirstapp/pages/api_test.dart';
import 'package:myfirstapp/pages/google_map.dart';
import 'package:myfirstapp/utilities/routes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: homepage(),

      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        //"/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.mapRoute: (context) => Google_Map(),
        MyRoutes.apiRoute: (context) => ApiPage(),
      },
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
