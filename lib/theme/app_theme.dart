import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const footerNoteStyle = TextStyle(
    color: AppColors.footerNote,
    fontSize: 10,
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.paper,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      primary: AppColors.gold,
      surface: AppColors.paper,
    ),
  );
}
