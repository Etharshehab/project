import 'package:bloc/bloc.dart';
import 'package:dapp/src/core/model/data/categrydata.dart';
import 'package:dapp/src/core/model/model/categorymodel.dart';

part 'product_state.dart';

class CategoryCubit extends Cubit<CategryState> {
  CategoryCubit(
    this.categoryData,
  ) : super(CategryInitial());
  final CategoryData categoryData;
  getDataPostCubit(String endpoint) async {
    emit(CategryLodingState());
    var response = await categoryData.getData(endpoint: endpoint);
    emit(CategrySucessState(list: response));
  }
}
