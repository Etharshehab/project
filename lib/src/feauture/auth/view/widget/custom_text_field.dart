import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;
  final Widget label;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            label: label,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: InkWell(
              onTap: () {
                controller.clear();
              },
              child: const Icon(Icons.clear),
            ),
            border: border(color: Colors.teal, radius: 30),
            enabledBorder: border(color: Colors.black, radius: 50),
            focusedBorder: border(color: Colors.grey, radius: 10)),
      ),
    );
  }
}

InputBorder border({required Color color, required double radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color),
  );
}
