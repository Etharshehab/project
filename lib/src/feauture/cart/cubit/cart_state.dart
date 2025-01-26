import 'package:dapp/src/feauture/cart/model/cart-model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartGetAllSuccess extends CartState {
  List<CartModel> listCart;
  CartGetAllSuccess({required this.listCart});
}

final class CartErrorState extends CartState {
  String errorMessage;
  CartErrorState({required this.errorMessage});
}

final class CartDelete extends CartState {}
