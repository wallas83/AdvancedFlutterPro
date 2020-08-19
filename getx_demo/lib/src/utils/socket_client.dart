import 'package:get/state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum SocketStatus { connecting, connected, joined, disconnected, error }

class SocketClient {
  SocketClient._internal();

  static SocketClient _instance = SocketClient._internal();
  static SocketClient get instance => _instance;

  RxInt _numUsers = 0.obs;
  RxString _inputText = "".obs;

  RxInt get numUsers => _numUsers;

  Rx<SocketStatus> _status = SocketStatus.connecting.obs;
  Rx<SocketStatus> get status => _status;

  String _nickName;
  IO.Socket _socket;
  Worker _typingWorker;
  void init() {
    debounce(this._inputText, (_) {
      // print('debounced ${this._inputText.value}');
      this._socket?.emit('stop typing');
      this._typingWorker = null;
    }, time: Duration(milliseconds: 500));
  }

  void connect() {
    this._socket =
        IO.io('https://socketio-chat-h9jt.herokuapp.com/', <String, dynamic>{
      'transports': ['websocket'],
      //'autoConnect': false
    });

    this._socket.on('connect', (_) {
      print('connected');
      this.status.value = SocketStatus.connected;
    });

    this._socket.on('connect_error', (_) {
      print('error $_');

      this.status.value = SocketStatus.error;
    });

    this._socket.on('disconnect', (_) {
      print('disconnected');

      this.status.value = SocketStatus.disconnected;
    });

    this._socket.on('login', (data) {
      print('$data');
      final int numUsers = data['numUsers'] as int;
      this._numUsers.value = numUsers;
      this.status.value = SocketStatus.joined;
    });
    this._socket.on('user joined', (data) {
      print('User joined $data ');
      this._numUsers.value = data['numUsers'] as int;
    });
  }

  void disconnect() {
    this._socket?.disconnect();
    this._socket = null;
  }

  void joinToChat(String nickname) {
    this._nickName = nickname;
    this._socket?.emit('add user', this._nickName);
  }

  void onInputChange(String text) {
    if (this._typingWorker == null) {
      this._typingWorker = once(this._inputText, (_) {
        //print('start typing');
        this._socket?.emit('typing');
      });
    }
    this._inputText.value = text;
  }
}
