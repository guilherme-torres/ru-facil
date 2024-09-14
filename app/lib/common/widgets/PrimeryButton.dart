import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class PrimeryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const PrimeryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onPressed != null ? AppColors.azulEscuro2 : AppColors.cinzaEscuro,
      borderRadius: BorderRadius.circular(38),
      child: InkWell(
        onTap: onPressed,
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
            text,
            style: AppTextStyle.subText2.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
