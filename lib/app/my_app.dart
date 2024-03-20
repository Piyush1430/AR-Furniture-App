import 'package:flutter/material.dart';
import 'package:new_app/core/constants/route_manager.dart';
import 'package:new_app/core/constants/theme_manager.dart';

import 'package:new_app/features/on_boarding/presentation_layer/pages/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      home: OnBoardingPage(
        screenSize: screenSize,
      ),
    );
  }
}
