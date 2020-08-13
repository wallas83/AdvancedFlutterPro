import 'package:flutter/material.dart';
import 'package:flutterLogin/src/utils/responsive.dart';
import 'package:flutterLogin/src/widgets/circle.dart';
import 'package:flutterLogin/src/widgets/icon_container.dart';
import 'package:flutterLogin/src/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    top: -(pinkSize) * 0.4,
                    left: (pinkSize) * 0.55,
                    child: Circle(
                      size: pinkSize,
                      colors: [Colors.pinkAccent, Colors.pink],
                    )),
                Positioned(
                    top: -(orangeSize) * 0.55,
                    left: -(orangeSize) * 0.15,
                    child: Circle(
                      size: orangeSize,
                      colors: [Colors.orange, Colors.deepOrangeAccent],
                    )),
                Positioned(
                    top: pinkSize * 0.35,
                    child: Column(
                      children: [
                        IconContainer(
                          size: responosive.wp(17),
                        ),
                        SizedBox(height: responosive.dp(3)),
                        Text(
                          'Hello Again \n welcome back',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responosive.dp(1.5)),
                        ),
                      ],
                    )),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
