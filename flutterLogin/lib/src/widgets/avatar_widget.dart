import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterLogin/src/utils/responsive.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responosive = Responsive(context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.black26,
                    offset: Offset(0, 26))
              ]),
          child: ClipOval(
            child: Image.network(
              'https://lh3.googleusercontent.com/-d-cldq0iIFQ/WpakxI3OXoI/AAAAAAAAOs0/v7lpT9KuFvMWyYUlcFBvonmUTFcfkbFhACHMYCw/avatar-santi%255B2%255D?imgmax=800',
              width: responosive.wp(25),
              height: responosive.wp(25),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.pink,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
