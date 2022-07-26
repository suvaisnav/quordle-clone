import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.enable,
  required this.selection,
  required this.field,
  required this.color,
  required this.fillColor}) : super(key: key);
   bool enable;
   bool selection;
   Color color;
   bool fillColor;
   TextEditingController field;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {



  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enable,
      enableInteractiveSelection: widget.selection,
      keyboardType: TextInputType.text ,
      controller: widget.field,
      maxLength: 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1)
      ],
      onChanged: (String value) async {

        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty) {
          FocusScope.of(context).previousFocus();
        }
        return;
      },
      decoration: InputDecoration(
        filled: widget.fillColor,
        fillColor: widget.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
