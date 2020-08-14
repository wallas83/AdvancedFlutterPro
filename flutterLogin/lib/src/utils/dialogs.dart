import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class Dialog {
  static info(BuildContext context, {String title, String content}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: title != null ? Text(title) : null,
              content: content != null ? Text(content) : null,
              actions: [
                CupertinoDialogAction(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}

class ProgresDialog {
  final BuildContext context;

  ProgresDialog(this.context);

  void show() {
    showCupertinoModalPopup(
        context: this.context,
        builder: (_) => Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }

  void dissmiss() {
    Navigator.pop(context);
  }
}
