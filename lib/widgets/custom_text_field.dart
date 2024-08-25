import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final Function(String?)? onSaved;
  final bool allowNumbers; // Added to allow/disallow numbers in text field

  CustomTextField({
    required this.hint,
    this.icon,
    this.onSaved,
    this.allowNumbers = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),             
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        } else if (!allowNumbers && _containsNumbers(value)) {
          return 'Name should not contain numbers';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  bool _containsNumbers(String value) {
    return RegExp(r'\d').hasMatch(value);
  }
}
