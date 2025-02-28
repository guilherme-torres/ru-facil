import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/routes.dart';
import 'package:app_flutter/features/emailValidating/email_validating_page.dart';
import 'package:app_flutter/features/navigationBottom/navigation_bottom.dart';
import 'package:app_flutter/features/Sign_in/Sign_in_page.dart';
import 'package:app_flutter/features/onboardPage/onboard_Page.dart';
import 'package:app_flutter/features/qrCode/qr_code.dart';
import 'package:app_flutter/features/sign_up/Sign_up_page.dart';
import 'package:app_flutter/features/splash/splash_page.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.azulEscuro2,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.inicial: (context) => const OnboardPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.login: (context) => const SignIn(),
        NamedRoutes.email: (context) => EmailValidationScreen(),
        NamedRoutes.navigation: (context) => NavigationBottom(),
        NamedRoutes.qrcode: (context) => const QrCode(),
      },
    );
  }
}
