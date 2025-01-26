import 'package:dapp/src/feauture/auth/cubit/register_cubit.dart';
import 'package:dapp/src/feauture/auth/view/screens/register_screen.dart';
import 'package:dapp/src/feauture/cart/cubit/cart_cubit.dart';
import 'package:dapp/src/feauture/favourite/cubit/fav_cubit.dart';
import 'package:dapp/src/feauture/layoutscreen.dart';
import 'package:dapp/src/feauture/profile/cubit/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => RegisterCubit()), // Register Cubit
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => FavCubit(),
        ) // Cart Cubit
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), // Now RegisterCubit is available here
      ),
    );
  }
}
