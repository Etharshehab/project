// import 'dart:convert';
// import 'dart:io';
// import 'package:dapp/src/feauture/auth/cubit/register_state.dart';
// import 'package:dapp/src/feauture/auth/model/data_auth/data_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(RegisterInitial());
//   final DataAuth auth = DataAuth();
//   ImagePicker picker = ImagePicker();
//   File? image;
//   String? userImage;
//   static AuthCubit get(context) => BlocProvider.of(context);
//   Future<void> addImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       Uint8List bytes = File(image!.path).readAsBytesSync();
//       userImage = base64Encode(bytes);
//       if (kDebugMode) {
//         print('images = $userImage');
//       }
//       emit(ChooseImage());
//     } else {
//       if (kDebugMode) {
//         print('no image selected');
//       }
//     }
//   }

//   PostDataCubit(
//       {required name,
//       required email,
//       required phone,
//       required nationalId,
//       required gender,
//       required password,
//       required token,
//       required profileImage}) async {
//     var user = await auth.PostData(
//         name: name,
//         email: email,
//         phone: phone,
//         nationalId: nationalId,
//         gender: gender,
//         password: password,
//         token: token,
//         profileImage: profileImage);
//     emit(SucessState(userdata: user));
//   }
// }
