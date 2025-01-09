import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/core/style/textstyle.dart';
import 'package:dapp/src/feauture/men_clothing/view/widget/customGridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenClothing extends StatelessWidget {
  final categoryData = CategoryData();
  MenClothing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(categoryData)..getDataPostCubit("men's%20clothing"),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10),
              child: Text('MenClothing', style: titleStyle),
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
