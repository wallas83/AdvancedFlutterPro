import 'package:flutterLogin/src/api/my_api.dart';
import 'package:meta/meta.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String avatar;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {@required this.id,
      @required this.username,
      @required this.email,
      this.avatar,
      @required this.createdAt,
      @required this.updatedAt});

  setAvatar(String url) {
    return User(
        id: this.id,
        username: this.username,
        email: this.email,
        avatar: url,
        createdAt: this.createdAt,
        updatedAt: this.updatedAt);
  }

  static User fromJson(Map<String, dynamic> json) {
    String avatar;

    if (json['avatar'] != null) {
      avatar = baseUrl + json['avatar'];
    }
    return User(
        id: json['_id'],
        username: json['username'],
        email: json['email'],
        avatar: avatar,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }
}
