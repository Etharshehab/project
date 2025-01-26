import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final void Function() onPressed;
  final String data;
  const Custombutton({
    super.key,
    required this.onPressed,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: ListTile());
  }
}
