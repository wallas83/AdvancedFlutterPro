import 'package:flutter/material.dart';
import 'package:flutterLogin/src/utils/responsive.dart';
import 'package:flutterLogin/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      // left: 20,
      // right: 20,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 430 : 360),
        child: Column(
          children: [
            InputText(
              label: 'EMAIL ADRRES',
              keyboardType: TextInputType.emailAddress,
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
              onChange: (text) {},
            ),
            SizedBox(
              height: responsive.dp(2),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
              child: Row(
                children: [
                  Expanded(
                    child: InputText(
                      label: 'PASSWORD',
                      obscureText: true,
                      borderEnable: false,
                      onChange: (text) {},
                      fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                    ),
                  ),
                  FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: () {},
                      child: Text('forgot the password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.dp(1.5))))
                ],
              ),
            ),
            SizedBox(
              height: responsive.dp(5),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(1.5)),
                ),
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(
              height: responsive.dp(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to Friendly Desi?',
                  style: TextStyle(fontSize: responsive.dp(1.5)),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.pinkAccent, fontSize: responsive.dp(1.5)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: responsive.dp(10),
            )
          ],
        ),
      ),
    );
  }
}
