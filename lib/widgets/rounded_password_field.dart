import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String text;
  final bool passenable;
  final Function() passHideShow;

  RoundedPasswordField({
    required this.onChanged,
    required this.controller,
    required this.text,
    required this.passenable,
    required this.passHideShow,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          obscureText: passenable,
          onChanged: onChanged,
          controller: controller,
          cursorColor: color1,
          decoration: InputDecoration(
            hintText: text,
            icon: const Icon(
              Icons.lock,
              color: color1,
            ),
            suffixIcon: InkWell(
              onTap: passHideShow,
              child: Icon(
                passenable ? Icons.remove_red_eye : Icons.visibility_off,
                color: color1,
              ),
            ),
            border: InputBorder.none,
          )),
    );
  }
}
