import 'package:bloc/bloc.dart';
import 'package:dapp/myapp.dart';
import 'package:dapp/src/core/block_observer.dart';
import 'package:dapp/src/core/builder/cash.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  CacheShared.init();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}
