import 'package:flutter/material.dart';
import 'package:dapp/src/feauture/home/view/widget/drawerbody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const Drawerbody(), // Include your Drawerbody widget
      body: Center(
        child: const Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
