import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_demo/src/utils/socket_client.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: Text('lalala')),
            CupertinoTextField(
              onChanged: SocketClient.instance.onInputChange 
            )
          ],
        ),
      ),
    );
  }
}
