import 'package:dapp/src/feauture/category/view/screens/category-screen.dart';
import 'package:dapp/src/feauture/get_lapTop/view/screens/get_lap.dart';
import 'package:dapp/src/feauture/home/view/widget/category-cart.dart';
import 'package:dapp/src/feauture/home/view/widget/sales-slider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Sales Slider
          SaleSlider(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCategoryCard(
                    context,
                    icon: Icons.electrical_services,
                    title: 'Electronics',
                    color: Colors.blue[100]!,
                    category: "Electronics",
                    endpoint: "electronics",
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.diamond,
                    title: 'Jewelry',
                    color: Colors.pink[100]!,
                    category: "Jewelry",
                    endpoint: "jewelery",
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.man,
                    title: 'Men Clothing',
                    color: Colors.green[100]!,
                    category: "Men Clothing",
                    endpoint: "men's clothing",
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.woman,
                    title: 'Women Clothing',
                    color: Colors.purple[100]!,
                    category: "Women Clothing",
                    endpoint: "women's clothing",
                  ),
                  CategoryCart(
                    color: Colors.yellow[100]!,
                    icon: Icons.laptop,
                    title: "Lap Top",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetLapTop()),
                      );
                    },
                  ),
                  CategoryCart(
                      color: Colors.grey[200]!,
                      icon: Icons.add,
                      title: "more",
                      onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required String category,
    required String endpoint,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryScreen(
            category: category,
            endpoint: endpoint,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.black54,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
