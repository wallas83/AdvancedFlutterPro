import 'package:flutter/material.dart';
import 'package:flutterLogin/src/api/my_api.dart';
import 'package:flutterLogin/src/utils/dialogs.dart';
import 'package:flutterLogin/src/utils/responsive.dart';
import 'package:flutterLogin/src/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _email;
  String _password;
  String _user;
  GlobalKey<FormState> _formkey = GlobalKey();
  _submit() async {
    final isOk = _formkey.currentState.validate();
    print('form is $isOk');

    if (isOk)  {

      await MyApi.instance.register(context, username: _user, email: _email, password: _password);
      //progresDialog.dissmiss();
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
                label: 'USER NAME',
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChange: (text) {
                  _user = text;
                },
                validator: (text) {
                  if (text.trim().length < 5) {
                    return 'invalid user';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
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
                          if (text.trim().length < 6) {
                            return 'invalid password';
                          }
                          return null;
                        },
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                      ),
                    ),
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
                    'Sign Up',
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
                    'Already have an account?',
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: Text(
                      'Sign In',
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
