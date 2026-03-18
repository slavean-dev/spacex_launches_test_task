import 'package:flutter/material.dart';
import 'package:tbr_flutter_internship_test/core/theme/theme.dart';

import 'features/rockets/presentation/screens/rockets_overview_screen/rockets_overview_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.baseTheme,
      debugShowCheckedModeBanner: false,
      home: const RocketsOverviewScreen(),
    );
  }
}
