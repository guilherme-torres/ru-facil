import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:app_flutter/common/variable/token_codes.dart';
import 'package:flutter/material.dart';

class Tokens extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;
  const Tokens({required this.index, super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          width: 330,
          height: 70,
          child: Stack(
            children: [
              Positioned(
                top: 21.0,
                left: 40.0,
                child: Text(
                  "Código ${codeList[index]}",
                  style: AppTextStyle.subText2.copyWith(
                    color: AppColors.cinzaEscuro,
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 23.0,
                child: Icon(Icons.circle, color: Colors.green),
              ),
              Positioned(
                right: 10.0,
                top: 20.0,
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.azulEscuro2,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
