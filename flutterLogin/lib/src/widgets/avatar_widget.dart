import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;
  final double imageSize;

  const Avatar({Key key, this.url, this.onPressed, this.imageSize = 100}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
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
               this.url ?? 'https://www.w3schools.com/howto/img_avatar.png',
              width: this.imageSize,
              height: this.imageSize,
              fit: BoxFit.cover,
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
              onPressed: this.onPressed ),
        ),
      ],
    );
  }
}
