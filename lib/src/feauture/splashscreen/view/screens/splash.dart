import 'package:dapp/src/feauture/home/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black, // Set background color
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }
}
