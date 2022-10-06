import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String text;
  const RoundedPasswordField({
    required this.onChanged,
    required this.controller,
    required this.text,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        cursorColor: color1,
        decoration: InputDecoration(
          hintText: text,
          icon: Icon(
            Icons.lock,
            color: color1,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: color1,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
