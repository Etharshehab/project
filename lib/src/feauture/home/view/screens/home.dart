import 'package:dapp/src/feauture/home/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:dapp/src/feauture/home/view/widget/drawerbody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const Drawerbody(), // Include your Drawerbody widget
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent.shade100,
              Colors.pinkAccent.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Let's start your shopping journey",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.shopping_cart,
                size: 50,
                color: Colors.white, // Icon color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
