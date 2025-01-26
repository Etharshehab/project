import 'package:dapp/src/feauture/get_lapTop/model/get_laptop_model.dart';

sealed class LapTopState {}

final class LapTopInitial extends LapTopState {}

final class LapTopLoding extends LapTopState {}

final class LapTopSucess extends LapTopState {
  final List<Product> listlap;
  LapTopSucess({required this.listlap});
}
