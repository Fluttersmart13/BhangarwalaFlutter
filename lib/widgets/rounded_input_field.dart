import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_field_container.dart';

import '../../../constants/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: color1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color1,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
