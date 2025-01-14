import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/core/style/textstyle.dart';
import 'package:dapp/src/feauture/electronics/view/widget/customGridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Electronic extends StatelessWidget {
  final categoryData = CategoryData();
  Electronic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(categoryData)..getDataPostCubit("electronics"),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text('Electronics', style: titleStyle),
                ],
              ),
            ),
            Expanded(
              child: CustomGridView(), // Use your custom GridView widget
            ),
          ],
        ),
      ),
    );
  }
}
