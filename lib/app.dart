import 'package:flutter/material.dart';

import 'pages/landing_page.dart';
import 'theme/app_theme.dart';

class DeerCompanyApp extends StatelessWidget {
  const DeerCompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeeR Company | نصنع انطباعك',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: LandingPage(),
      ),
    );
  }
}
