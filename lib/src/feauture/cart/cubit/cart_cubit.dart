import 'package:dapp/src/feauture/cart/cubit/cart_state.dart';
import 'package:dapp/src/feauture/cart/model/cart-service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartService cartService = CartService();

  getAddToCartCubit() async {
    emit(CartLoadingState());
    CartService.addCartData();
    emit(CartSuccessState());
  }

  getAllCartCubit() async {
    emit(CartLoadingState());
    var succes = await cartService.getAllCart();
    emit(CartGetAllSuccess(listCart: succes));
  }

  deleteCartCubit({required String productId}) {
    emit(CartLoadingState());
    cartService.deleteCart(productId: productId);
    emit(CartDelete());
    getAllCartCubit();
  }
}
