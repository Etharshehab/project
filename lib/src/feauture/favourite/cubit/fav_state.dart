part of 'fav_cubit.dart';

sealed class FavState {}

final class FavInitial extends FavState {}

final class Favload extends FavState {}

final class FavSucess extends FavState {}

final class FavGetSucess extends FavState {
  List<Favmodel> listfav;
  FavGetSucess({required this.listfav});
}
