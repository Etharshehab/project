import 'dart:convert';
import 'dart:io';

import 'package:dapp/src/feauture/auth/cubit/register_state.dart';
import 'package:dapp/src/feauture/auth/model/register_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit() : super(RegisterInitial());
  final AuthData authData = AuthData();

  // Register function
  postDataCubit({
    required nameData,
    required emailData,
    required phoneData,
    required nationalIdData,
    required genderData,
    required passwordData,
  }) async {
    var user = await authData.postData(
        name: nameData,
        email: emailData,
        phone: phoneData,
        nationalId: nationalIdData,
        gender: genderData,
        password: passwordData,
        profileImage: userImage);
    emit(RegisterSuccess(userData: user));
  }

  // Login function
  loginCubit({required String nameData, required String passwordData}) async {
    try {
      emit(LoginLoad());
      var user = await authData.login(name: nameData, password: passwordData);
      emit(LoginSuccess(userData: user));
    } catch (e) {
      emit(LoginFail(errorMessage: e.toString()));
    }
  }

  ImagePicker picker = ImagePicker();
  File? image;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }
}
