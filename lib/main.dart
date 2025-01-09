import 'package:bloc/bloc.dart';
import 'package:dapp/myapp.dart';
import 'package:dapp/src/core/block_observer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
  Bloc.observer = MyBlocObserver();
}
