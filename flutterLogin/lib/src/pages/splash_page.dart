import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutterLogin/src/pages/home_page.dart';
import 'package:flutterLogin/src/pages/login_page.dart';
import 'package:flutterLogin/src/utils/auth.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    //sin el tiempo  de vida
    //final Session session = await Auth.instance.getSession();
    final String token = await Auth.instance.accessToken;
    if (token != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }
}
