import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:app_flutter/common/widgets/password_form_field.dart';
import 'package:app_flutter/common/widgets/primery_button.dart';
import 'package:app_flutter/common/widgets/widget_formulario.dart';
import 'package:app_flutter/common/constant/routes.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                    child: Image.asset('assets/images/image 4.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Bem-vindo!',
                    textAlign: TextAlign.center, style: AppTextStyle.bigText),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Faça seu login',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.subText1,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Form(
                  child: Column(
                    children: [
                      WidgetFormulario(
                        texto: 'E-mail',
                        hind: 'Aluno@ufpi.edu.br',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Passwordformfield(
                        texto: 'senha',
                        hind: '********',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: PrimeryButton(
                    text: 'Entrar',
                    onPressed: () {
                      Navigator.pushNamed(context, NamedRoutes.navigation);
                    },
                  ),
                ),
                const SizedBox(height: 20),
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
                          'Esqueci minha senha.',
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 15, color: AppColors.azulEscuro1),
                        ),
                      ),
                    ),
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
