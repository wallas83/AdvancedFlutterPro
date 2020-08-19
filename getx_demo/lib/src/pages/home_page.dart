import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/src/pages/home_page_widgets/chat.dart';
import 'package:getx_demo/src/pages/home_page_widgets/nickname_form.dart';
import 'package:getx_demo/src/utils/socket_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SocketClient.instance.init();
    SocketClient.instance.connect();
  }

  @override
  void dispose() {
    SocketClient.instance.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final users = SocketClient.instance.numUsers;
          return Text('Users: (${users.value})');
        }),
      ),
      body: Obx(() {
        final status = SocketClient.instance.status;
        if (status.value == SocketStatus.connecting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (status.value == SocketStatus.connected) {
          return NickNameForm();
        } else if (status.value == SocketStatus.joined) {
          return Chat();
        } else {
          return Center(
            child: Text('Disconnected'),
          );
        }
      }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
