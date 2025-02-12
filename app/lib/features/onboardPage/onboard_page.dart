import 'package:app_flutter/common/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/routes.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 180),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/image 4.png'),
            ),
          ),
          const SizedBox(height: 20),
          Text("Olá, faça cadastro",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.subText2.copyWith(color: AppColors.azulEscuro2)),
          Text(" ou login para continuar.",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.subText2.copyWith(color: AppColors.azulEscuro2)),
          const SizedBox(height: 40),
          PrimeryButton(
              text: "Fazer cadastro",
              onPressed: () {
                Navigator.pushNamed(context, NamedRoutes.signUp);
              }),
          const SizedBox(height: 20),
          PrimeryButton(
              text: "Fazer login",
              onPressed: () {
                Navigator.pushNamed(context, NamedRoutes.login);
              }),
        ],
      ),
    );
  }
}
