import 'package:dapp/src/core/style/textstyle.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10),
      child: Row(children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
            icon: Icon(Icons.arrow_back)),
        Text('jewelwery', style: titleStyle),
      ]),
    );
  }
}
