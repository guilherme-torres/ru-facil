import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class EmailValidating extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const EmailValidating({
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 50,
        child: TextFormField(
          cursorColor: AppColors.azulEscuro2,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira o código de validação';
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 1) {
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          },
        ),
      ),
    );
  }
}
