part of 'settings.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.dark;
  Future<void> updateThemeMode(ThemeMode theme) async {}
}
