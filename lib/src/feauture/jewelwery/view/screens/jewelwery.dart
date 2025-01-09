import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/feauture/jewelwery/view/widget/appbar.dart';
import 'package:dapp/src/feauture/jewelwery/view/widget/customGridview.dart'; // Import your custom GridView widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Jewelwery extends StatelessWidget {
  final categoryData = CategoryData();

  Jewelwery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(categoryData)..getDataPostCubit("jewelery"),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom AppBar
            const Appbar(),

            // GridView Section
            Expanded(
              child: CustomGridView(), // Use your custom GridView widget
            ),
          ],
        ),
      ),
    );
  }
}
