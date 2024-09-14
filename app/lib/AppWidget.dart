import 'package:app_flutter/common/constant/routes.dart';
import 'package:app_flutter/features/EmailValidating/EmailValidating.dart';
import 'package:app_flutter/features/Sign_in/Sign_in_page.dart';
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
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      ),
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.inicial: (context) => const SignUpPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.login: (context) => const SignIn(),
        NamedRoutes.email: (context) => const Emailvalidating()
      },
    );
  }
}
