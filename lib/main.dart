import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings.dart';
import 'src/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  await di.initInjection();
  runApp(MyApp(settingsController: settingsController));
}
