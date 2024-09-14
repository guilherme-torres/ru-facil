import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class Emailvalidating extends StatelessWidget {
  const Emailvalidating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Center(
                    child: Image.asset('assets/images/image 4.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Verifique seu e-mail',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.mediumText1
                      .copyWith(color: AppColors.azulEscuro2),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Digite o código que foi enviado para o e-mail',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.subText1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              iconSize: 35.0,
              color: AppColors.azulEscuro2,
              onPressed: () {
                // Ação ao clicar no botão
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
