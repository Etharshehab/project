part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoding extends ProfileState {}

final class ProfileSucess extends ProfileState {
  final UserProfile data;
  ProfileSucess({required this.data});
}
