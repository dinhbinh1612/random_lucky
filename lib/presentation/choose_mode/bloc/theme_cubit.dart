import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    if (json['themeMode'] == 'light') {
      return ThemeMode.light;
    } else if (json['themeMode'] == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.light:
        return {'themeMode': 'light'};
      case ThemeMode.dark:
        return {'themeMode': 'dark'};
      case ThemeMode.system:
        return {'themeMode': 'system'};
    }
  }
}
