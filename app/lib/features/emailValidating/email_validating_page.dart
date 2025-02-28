import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:app_flutter/common/constant/routes.dart';
import 'package:app_flutter/common/widgets/custom_email_form.dart';
import 'package:app_flutter/common/widgets/primery_button.dart';
import 'package:flutter/material.dart';

class EmailValidationScreen extends StatelessWidget {
  EmailValidationScreen({super.key});
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 120),
              SizedBox(
                height: 150,
                width: 150,
                child: Center(child: Image.asset('assets/images/image 4.png')),
              ),
              const SizedBox(height: 20),
              Text(
                'Verifique seu e-mail',
                textAlign: TextAlign.center,
                style: AppTextStyle.mediumText1.copyWith(
                  color: AppColors.azulEscuro2,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Digite o código que foi enviado para o e-mail',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subText1,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return EmailValidating(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    nextFocusNode: index < 5 ? focusNodes[index + 1] : null,
                  );
                }),
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: PrimeryButton(text: "Confirmar", onPressed: () {}),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 125.0),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withValues(alpha: 0.1),
                    highlightColor: Colors.blue.withValues(alpha: 0.1),
                    child: const Align(
                      child: Text(
                        'Enviar novamente.',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.azulEscuro1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              iconSize: 35.0,
              color: AppColors.azulEscuro2,
              onPressed: () {
                Navigator.pushNamed(context, NamedRoutes.inicial);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
