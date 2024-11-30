import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider()
      : super(ThemeData.light()); // Default theme is light

  // Toggle between light and dark themes
  void toggleTheme() {
    state = state.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light();
  }
}
