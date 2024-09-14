import 'dart:async';
import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2),
      navegatorToSignUpPage,
    );
  }

  void navegatorToSignUpPage() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoutes.inicial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.azulEscuro1,
              AppColors.brancoFosco,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_ufpi-removebg-preview.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              'RU fácil',
              style:
                  AppTextStyle.bigText1.copyWith(color: AppColors.brancoFosco),
            ),
          ],
        ),
      ),
    );
  }
}
