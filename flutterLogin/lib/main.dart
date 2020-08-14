import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterLogin/src/pages/home_page.dart';
import 'package:flutterLogin/src/pages/login_page.dart';
import 'package:flutterLogin/src/pages/registro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(),
      routes: {
        RegisterPage.routeName : (BuildContext context) => RegisterPage(),
        LoginPage.routeName   :  (BuildContext  context) => LoginPage(),
        HomePage.routeName    : (BuildContext context) => HomePage()
      },
    );
  }
}
