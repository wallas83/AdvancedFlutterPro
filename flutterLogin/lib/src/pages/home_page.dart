import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutterLogin/src/api/my_api.dart';
import 'package:flutterLogin/src/models/user.dart';
import 'package:flutterLogin/src/utils/auth.dart';
import 'package:flutterLogin/src/utils/dialogs.dart';
import 'package:flutterLogin/src/utils/extras.dart';
import 'package:flutterLogin/src/widgets/avatar_widget.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  User user;

  @override
  void afterFirstLayout(BuildContext context) {
    this._init();
  }

  _init() async {
    this.user = await MyApi.instance.getUserInfo();
    setState(() {});
  }

  _pickImage() async {
    final PickedFile pickedFile = await Extras.pickImage(false);
    if (pickedFile != null) {
      print('path ${pickedFile.path}');
      final bytes = await pickedFile.readAsBytes();
      ProgresDialog progresDialog = ProgresDialog(context);
      progresDialog.show();
      final String result =
          await MyApi.instance.updateAvatar(bytes, pickedFile.path);

      progresDialog.dissmiss();

      if (result != null) {
        this.user = this.user.setAvatar(result);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            this.user == null
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Avatar(
                        imageSize: 100,
                        url: this.user.avatar,
                        onPressed: this._pickImage,
                      ),
                      Text("El usuario es: ${this.user.username}"),
                      Text("El email es:  ${this.user.email}"),
                      Text("Creado en: ${this.user.createdAt.toString()}")
                    ],
                  ),
            FlatButton(
                onPressed: () => Auth.instance.logOut(context),
                child: Text('Log Out'))
          ],
        ),
      ),
    ));
  }
}
