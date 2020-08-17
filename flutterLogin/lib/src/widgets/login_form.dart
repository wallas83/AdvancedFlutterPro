import 'package:flutter/material.dart';
import 'package:flutterLogin/src/api/my_api.dart';
import 'package:flutterLogin/src/utils/responsive.dart';
import 'package:flutterLogin/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email;
  String _password;
  GlobalKey<FormState> _formkey = GlobalKey();
  _submit() {
    final isOk = _formkey.currentState.validate();
    print('form is $isOk');

    if (isOk) {
      print('$_email, $_password');
      
      MyApi.instance.login(context, email: _email, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      // left: 20,
      // right: 20,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 430 : 360),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              InputText(
                label: 'EMAIL ADRRES',
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChange: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text.contains('@')) {
                    return 'invalid email';
                  }
                  return null;
                },
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
                        onChange: (text) {
                          _password = text;
                        },
                        validator: (text) {
                          if (text.trim().length == 0) {
                            return 'invalid password';
                          }
                          return null;
                        },
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.4),
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
                  onPressed: _submit,
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
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: responsive.dp(1.5)),
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
      ),
    );
  }
}
