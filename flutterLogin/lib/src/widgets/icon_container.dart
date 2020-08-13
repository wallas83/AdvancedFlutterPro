import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({@required this.size}) : assert(size != null && size > 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.size * 0.15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 15),

            )
          ]),
      padding: EdgeInsets.all(this.size * 0.15),
      child: Center(
        child: SvgPicture.asset(
          'assets/logo.svg',
          width: this.size * 0.7,
          height: this.size * 0.7 ,
        ),
      ),
    );
  }
}
