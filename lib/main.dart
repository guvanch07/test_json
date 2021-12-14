import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_skleton/bloc_observer.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  Bloc.observer = AppBlocObserver();

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}
