import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/widgets/text_field_container.dart';

import '../../../constants/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool readOnly;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.phone,
    required this.onChanged,
    required this.controller,
    required this.readOnly,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: color1,
        readOnly: readOnly,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
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
