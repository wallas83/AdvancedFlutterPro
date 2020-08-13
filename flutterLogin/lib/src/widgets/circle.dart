import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  final List<Color> colors;
  Circle({@required this.size, this.colors})
      : assert(size != null && size > 0),
        assert(colors != null && colors.length >= 2);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: this.colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          ),
          // color: Colors.amber,
          shape: BoxShape.circle),
    );
  }
}
