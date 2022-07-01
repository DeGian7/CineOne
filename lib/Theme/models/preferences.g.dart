part of 'preferences.dart';

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic> {
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};