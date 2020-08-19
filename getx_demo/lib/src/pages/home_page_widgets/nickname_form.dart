import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_demo/src/utils/socket_client.dart';

class NickNameForm extends StatefulWidget {
  @override
  _NickNameFormState createState() => _NickNameFormState();
}

class _NickNameFormState extends State<NickNameForm> {
  String _nickName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'What is your nickname?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            onChanged: (text) {
              this._nickName = text;
            },
            placeholder: 'Insert your nickName',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  if (this._nickName.trim().length > 0) {
                    SocketClient.instance.joinToChat(this._nickName);
                  }
                },
                child: Text('Join to chat')),
          )
        ],
      ),
    );
  }
}
