import 'package:app_flutter/features/onboarding/onboarding_page.dart';
//import 'package:app_flutter/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        home: const OnboardingPage());
  }
}
