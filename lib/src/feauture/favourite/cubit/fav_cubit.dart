import 'package:bloc/bloc.dart';
import 'package:dapp/src/feauture/favourite/data/favdata.dart';
import 'package:dapp/src/feauture/favourite/model/favmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  static FavCubit get(context) => BlocProvider.of(context);
  FavCubit() : super(FavInitial());
  final FavData favData = FavData();
  addFavCubit({required String id}) async {
    emit(Favload());
    await favData.addFav(id: id);
    getAllFav();
  }

  getAllFav() async {
    emit(Favload());
    var sucess = await favData.getAllFav();
    emit(FavGetSucess(listfav: sucess));
  }

  deletFav({required String productId}) {
    emit(Favload());
    favData.dele(productId: productId);
    getAllFav();
  }
}
