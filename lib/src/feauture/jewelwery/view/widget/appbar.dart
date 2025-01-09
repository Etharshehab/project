import 'package:dapp/src/core/style/textstyle.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10),
      child: Row(children: [
        Text('jewelwery', style: titleStyle),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
      ]),
    );
  }
}
