import 'package:dapp/src/feauture/electronics/view/screen/electronic.dart';
import 'package:dapp/src/feauture/jewelwery/view/screens/jewelwery.dart';
import 'package:dapp/src/feauture/men_clothing/view/screens/men_clothing.dart';
import 'package:dapp/src/feauture/woman_clothing/view/screens/woman_clothing.dart';
import 'package:flutter/material.dart';

class Drawerbody extends StatelessWidget {
  const Drawerbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.electrical_services),
            title: const Text('Electronics'),
            subtitle: const Text('Go to electronics page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Electronic()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.diamond),
            title: const Text('Jewelwery'),
            subtitle: const Text('Go to jewelwery page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Jewelwery()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.man),
            title: const Text('Men Clothing'),
            subtitle: const Text('Go to men clothing page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenClothing()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.woman),
            title: const Text('Women Clothing'),
            subtitle: const Text('Go to women clothing page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WomanClothing()),
              );
            },
          ),
        ],
      ),
    );
  }
}
