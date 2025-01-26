import 'package:dapp/src/feauture/get_lapTop/cubit/lap_top_state.dart';
import 'package:dapp/src/feauture/get_lapTop/model/get_laptop_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LapTopCubit extends Cubit<LapTopState> {
  LapTopCubit() : super(LapTopInitial());
  final GetLaptopData data = GetLaptopData();
  getAllLapCubit() async {
    emit(LapTopLoding());
    var listlap = await data.getAllLap();
    emit(LapTopSucess(listlap: listlap));
  }
}
