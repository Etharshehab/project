import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final String endpoint;

  const CategoryScreen({
    super.key,
    required this.category,
    required this.endpoint,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(CategoryData())..getDataPostCubit(endpoint),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
          centerTitle: true,
          backgroundColor: Colors.purple[100]!,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocBuilder<CategoryCubit, CategryState>(
            builder: (context, state) {
              if (state is CategryLodingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategrySucessState) {
                if (state.list.isEmpty) {
                  return const Center(
                    child: Text(
                      "No products found!",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(context),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7, // Adjust for better layout
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final product = state.list[index];
                    return _buildCategoryCard(
                      image: product.image,
                      title: product.title,
                      price: product.price,
                    );
                  },
                );
              } else if (state is CategryFailuerState) {
                return Center(
                  child: Text(
                    "Error: ${state.error}",
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              }
              return const Center(child: Text("No Data Available"));
            },
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 2;
    } else if (width < 900) {
      return 3;
    } else {
      return 4;
    }
  }

  Widget _buildCategoryCard({
    required String image,
    required String title,
    required double price,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              "\$${price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
