import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/feauture/jewelwery/view/widget/sucess.dart'; // Replace with your success widget path
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategryState>(
      builder: (context, state) {
        if (state is CategrySucessState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.65,
            ),
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return Sucesswidget(
                productModel: state.list[index],
              );
            },
          );
        } else if (state is CategryLodingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategryFailuerState) {
          return Center(
            child: Text(
              'Error: ${state.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'No Data Available',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
      },
    );
  }
}
