import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/core/style/textstyle.dart';
import 'package:dapp/src/feauture/woman_clothing/view/widget/customGridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomanClothing extends StatelessWidget {
  final categoryData = CategoryData();
  WomanClothing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(categoryData)..getDataPostCubit("women's%20clothing"),
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
                  Text('MenClothing', style: titleStyle),
                ],
              ),
            ),
            Expanded(
              child: CustomGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
