import 'package:dapp/src/feauture/cart/view/screens/cart.dart';
import 'package:dapp/src/feauture/favourite/view/screens/fav.dart';
import 'package:dapp/src/feauture/home/view/screens/home.dart';
import 'package:dapp/src/feauture/profile/view/screens/drawerbody.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // المتغير الذي يتحكم في تغيير الصفحات

  // قائمة تحتوي على الشاشتين
  final List<Widget> _screens = [
    Home(),
    const Favourite(), // شاشة المفضلة
    const CartScreen(),
    Profile()

    // شاشة اللابتوب
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // تحديث الفهرس عند النقر على الزر
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
        selectedItemColor: Colors.redAccent, // لون العنصر المحدد
        unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
        backgroundColor: Colors.white, // خلفية البار
      ),
    );
  }
}
