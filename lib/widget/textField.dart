

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String textHint;
  String lableText;
  Icon icon;
  MyTextField( this.lableText,this.textHint,this.icon);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: textHint,
        labelStyle: TextStyle(color: Colors.black26),
        hintStyle: TextStyle(color: Colors.black26),
        labelText:lableText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Colors.white24,
        suffixIcon:icon,
      ),
    );
  }
}
