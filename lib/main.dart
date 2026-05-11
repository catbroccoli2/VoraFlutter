import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/climate_state.dart';
import 'screens/climate_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ClimateState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vora Climate Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
      ),
      home: const ClimateScreen(),
    );
  }
}