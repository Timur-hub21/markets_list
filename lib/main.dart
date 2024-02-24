import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markets_list/application.dart';

/// Only vertical resolution
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Application());
}
