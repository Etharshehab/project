import 'package:flutter/material.dart';

class CardProfileWidget extends StatelessWidget {
  const CardProfileWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 2,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ListTile(
            leading: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Icon(
              icon,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
