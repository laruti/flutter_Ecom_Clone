import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // Background for components like cards
    primary: Colors.grey.shade600, // Primary color for key UI elements
    secondary: Colors.grey.shade700, // Accent color for highlights
    inversePrimary: Colors.grey.shade900, // Contrast color for primary
    inverseSurface: Colors.white,
  ),
);
