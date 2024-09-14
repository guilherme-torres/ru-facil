import 'dart:developer';
import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:app_flutter/common/constant/routes.dart';
import 'package:app_flutter/common/utils/validator.dart';
import 'package:app_flutter/common/widgets/CustomCircularProgressIndicator.dart';
import 'package:app_flutter/common/widgets/PasswordFormField.dart';
import 'package:app_flutter/common/widgets/PrimeryButton.dart';
import 'package:app_flutter/common/widgets/WidgetFormulario.dart';
import 'package:app_flutter/common/widgets/custom_Botton_Sheet.dart';
import 'package:app_flutter/features/sign_up/Sign_up_controller.dart';
import 'package:app_flutter/features/sign_up/Sign_up_state.dart';
import 'package:app_flutter/services/mock_auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: customCircularProgressIndicator(),
            ),
          );
        }
        if (_controller.state is SignUpSucessState) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            NamedRoutes.email,
          );
        }
        if (_controller.state is SignUpErrorState) {
          final error = _controller.state as SignUpErrorState;
          Navigator.pop(context);
          customModalBottomSheet(context,
              content: error.messagem, buttonText: 'Tente Novamente');
        }
      },
    );
  }

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
            Form(
              key: _formKey,
              child: Column(children: [
                WidgetFormulario(
                  controller: _nameController,
                  texto: 'Nome',
                  validator: Validator.validatorNome,
                ),
                const SizedBox(
                  height: 10,
                ),
                WidgetFormulario(
                  controller: _emailController,
                  texto: 'E-mail',
                  hind: 'aluno@ufpi.edu.br',
                  validator: Validator.validatorEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                Passwordformfield(
                  controller: _passwordController,
                  texto: 'Senha',
                  hind: '********',
                  helperText:
                      'A senha deve ter pelo menos 8 digitos, contendo uma letra e um número.',
                  validator: Validator.validatorSenha,
                ),
                const SizedBox(
                  height: 10,
                ),
                Passwordformfield(
                  texto: 'Confirmar senha',
                  hind: '********',
                  validator: (value) => Validator.validatorConfimarSenha(
                      value, _passwordController.text),
                ),
                const SizedBox(
                  height: 10,
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: PrimeryButton(
                text: 'Cadastrar',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    _controller.signUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    log('Erro');
                  }
                },
              ),
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
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NamedRoutes.login,
                      );
                    },
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
