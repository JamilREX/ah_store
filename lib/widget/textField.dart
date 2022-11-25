import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  String textHint;
  String labelText;
  Icon? icon;
  TextInputType keyboardType;
  TextEditingController textEditingController;
  final Function(String) onChanged;



  MyTextField(
      {super.key,
        required this.textEditingController,
        required this.onChanged,
      required this.labelText,
      required this.textHint,
      this.icon,
      this.keyboardType = TextInputType.text});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      textInputAction: TextInputAction.next,
      obscureText: widget.keyboardType==TextInputType.visiblePassword?hidden:false,
      onChanged:(value){

        setState(() {
          widget.onChanged;
        });
      },
      //textAlign: TextAlign.start,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.textHint,
        labelStyle: const TextStyle(color: Colors.black26),
        hintStyle: const TextStyle(color: Colors.black26),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white24,
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? hidden == true
                ? InkWell(
                    child: const Icon(Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        hidden = false;
                      });
                    },
                  )
                : InkWell(
                    child: const Icon(Icons.visibility),
                    onTap: () {
                      setState(() {
                        hidden = true;
                      });
                    },
                  )
            : widget.icon,
      ),
    );
  }
}
