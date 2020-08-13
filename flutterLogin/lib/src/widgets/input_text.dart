import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

      //TODO: falta el validator 
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool borderEnable;
  final double fontSize;
  final void Function(String text) onChange;
  InputText(
      {this.label = "",
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnable = true,
      this.fontSize = 15.0,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: this.fontSize),
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      onChanged: this.onChange,
      decoration: InputDecoration(
          enabledBorder: this.borderEnable
              ? UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : InputBorder.none,
          labelText: this.label,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          labelStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
