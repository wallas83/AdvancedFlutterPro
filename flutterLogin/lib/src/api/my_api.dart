import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterLogin/src/pages/home_page.dart';
import 'package:flutterLogin/src/utils/dialogs.dart';

class MyApi {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://curso-api-flutter.herokuapp.com'));
  Future<void> register(BuildContext context,
      {@required String username,
      @required String email,
      @required String password}) async {
    final ProgresDialog progresDialog = ProgresDialog(context);
    try {
      progresDialog.show();
      final Response response = await this._dio.post('/api/v1/register',
          data: {"username": username, "email": email, "password": password}
          //esto no es necesario ya que dio acepta aplicaion/json
          // options: Options(headers: {
          //   'Content-Type' : 'application/json',

          // })
          );
      progresDialog.dissmiss();
      if (response.statusCode == 200) {
        print(response.data);
        Dialog.info(context, title: 'GOOD', content: 'User Created');

        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (_) => false);
      }
    } catch (e) {
      progresDialog.dissmiss();
      if (e is DioError) {
        print(e.response.statusCode);
        print(e.response.data);
        Dialog.info(context,
            title: 'ERROR',
            content: e.response.statusCode == 409
                ? 'Duplicated email or username'
                : e.message);
      } else {
        print(e);
      }
    }
  }

  /*0 LOGIN */
  Future<void> login(BuildContext context,
      {@required String email, @required String password}) async {
    final ProgresDialog progresDialog = ProgresDialog(context);
    try {
      progresDialog.show();
      final Response response = await this._dio.post(
          '/api/v1/login',
          data: {"email": email, "password": password});
      print(response);

      progresDialog.dissmiss();
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (_) => false);
    } catch (e) {
      progresDialog.dissmiss();
      if (e is DioError) {
         print(e.response.statusCode);
        // print(e.response.data);
        String message = e.message;
        if (e.response.statusCode == 404) {
          message = 'User not found';
        } else if (e.response.statusCode == 403) {
          message = 'Invalid password';
        }
        Dialog.info(context, title: 'ERROR', content: message);
      } else {
        print(e);
      }
    }
  }
}
