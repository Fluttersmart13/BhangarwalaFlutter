import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_field_container.dart';

import '../../../constants/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
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
