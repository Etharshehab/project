part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SucessState extends AuthState {
  final userdata;
  SucessState({required this.userdata});
}

final class ChooseImage extends AuthState {}
