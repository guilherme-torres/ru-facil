import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
              AppColors.azulEscuro,
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
                  AppTextStyle.bigText.copyWith(color: AppColors.brancoFosco),
            ),
          ],
        ),
      ),
    );
  }
}
