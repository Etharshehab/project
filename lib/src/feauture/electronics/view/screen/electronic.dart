import 'package:dapp/src/core/cubit/cubit/product_cubit.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/feauture/electronics/view/widget/sucess.dart';
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
              child: Text(
                'Electronics',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CategoryCubit, CategryState>(
                builder: (context, state) {
                  if (state is CategrySucessState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    // عرض مؤشر تحميل
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategryFailuerState) {
                    // عرض رسالة خطأ
                    return Center(
                      child: Text(
                        'Error: ${state.error}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'No Data Available',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
