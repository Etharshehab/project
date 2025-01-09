part of 'product_cubit.dart';

sealed class CategryState {}

final class CategryInitial extends CategryState {}

final class CategryLodingState extends CategryState {}

final class CategrySucessState extends CategryState {
  List<Categorymodel> list;
  CategrySucessState({required this.list});
}

final class CategryFailuerState extends CategryState {
  final String error;
  CategryFailuerState({required this.error});
}
