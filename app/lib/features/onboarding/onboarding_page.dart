import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 150,
              width: 150,
              child: Center(
                child: Image.asset('assets/images/image 4.png'),
              ),
            ),
            const Text(
              'Bem-vindo!',
              textAlign: TextAlign.center,
              style: AppTextStyle.bigText2,
            ),
            const Text(
              'Faça seu cadastro',
              textAlign: TextAlign.center,
              style: AppTextStyle.subText1,
            ),
            const SizedBox(
              height: 40,
            ),
            const WidgetFormulario(texto: 'Nome'),
            const SizedBox(
              height: 10,
            ),
            const WidgetFormulario(texto: 'E-mail'),
            const SizedBox(
              height: 10,
            ),
            const WidgetFormulario(texto: 'Senha'),
            const SizedBox(
              height: 10,
            ),
            const WidgetFormulario(texto: 'Confirmar senha'),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: PrimeryButton(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Já possui uma conta ?',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withOpacity(0.1),
                    highlightColor: Colors.blue.withOpacity(0.1),
                    child: const Align(
                      child: Text(
                        ' Fazer login.',
                        style: TextStyle(
                            fontSize: 15, color: AppColors.azulEscuro1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetFormulario extends StatelessWidget {
  final String texto;
  const WidgetFormulario({
    required this.texto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: texto,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimeryButton extends StatelessWidget {
  final void Function()? onTap;
  const PrimeryButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.azulEscuro2,
      borderRadius: BorderRadius.circular(38),
      child: InkWell(
        onTap: () {},
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(38),
        child: Container(
          width: 200,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
          ),
          child: Text(
            'Cadastrar',
            style: AppTextStyle.subText2.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
