import 'package:bloc/bloc.dart';
import 'package:dapp/src/feauture/profile/model/profile_data.dart';
import 'package:dapp/src/feauture/profile/model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileData profileData = ProfileData();
  getProfilecubit() async {
    emit(ProfileLoding());
    var user = await profileData.getData();
    emit(ProfileSucess(data: user));
  }
}
