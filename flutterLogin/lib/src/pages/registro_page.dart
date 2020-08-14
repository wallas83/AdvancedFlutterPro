import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterLogin/src/utils/responsive.dart';
import 'package:flutterLogin/src/widgets/avatar_widget.dart';
import 'package:flutterLogin/src/widgets/circle.dart';
import 'package:flutterLogin/src/widgets/icon_container.dart';
import 'package:flutterLogin/src/widgets/login_form.dart';
import 'package:flutterLogin/src/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responosive = Responsive.of(context);
    // final Size size = MediaQuery.of(context).size;
    final double pinkSize = responosive.wp(80);
    final double orangeSize = responosive.wp(57);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responosive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: -(pinkSize) * 0.25,
                    left: (pinkSize) * 0.55,
                    child: Circle(
                      size: pinkSize,
                      colors: [Colors.pinkAccent, Colors.pink],
                    )),
                Positioned(
                    top: -(orangeSize) * 0.35,
                    left: -(orangeSize) * 0.15,
                    child: Circle(
                      size: orangeSize,
                      colors: [Colors.orange, Colors.deepOrangeAccent],
                    )),
                Positioned(
                    top: pinkSize * 0.15,
                    child: Column(
                      children: [
                        Text(
                          'Hello \n Sign up toget started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: responosive.dp(1.5),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: responosive.dp(5),
                        ),
                        Avatar()
                      ],
                    )),
                RegisterForm(),
                Positioned(
                    left: responosive.dp(1),
                    top: responosive.dp(1),
                    child: SafeArea(
                      child: CupertinoButton(
                          color: Colors.black26,
                          padding: EdgeInsets.all(18),
                          borderRadius: BorderRadius.circular(30),
                          child: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);  
                          }),
                    ))
                //LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
