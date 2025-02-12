import 'package:app_flutter/common/widgets/token_botton.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/common/constant/app_text_style.dart';

class Token extends StatefulWidget {
  const Token({super.key});

  @override
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {
  final codes = List<String?>.filled(5, null);
  late List<Widget> bottons;

  @override
  void initState() {
    super.initState();
    codes[0] = "123";
    codes[1] = "456";
    codes[2] = "789";
    codes[3] = "000";
    codes[4] = "aaa";
    bottons = List.generate(5, (index) {
      if (codes[index] != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
                children: [Tokens(code: codes[index]), SizedBox(height: 10.0)]),
          ],
        );
      } else {
        return SizedBox();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool thereIsCode = codes.any((code) => code != null);

    return Scaffold(
      backgroundColor: AppColors.brancoDeBackground,
      body: ListView(
        padding: EdgeInsets.only(left: 15.0),
        children: [
          const SizedBox(height: 80),
          Text("Olá, fulano!",
              style:
                  AppTextStyle.bigText1.copyWith(color: AppColors.azulEscuro2)),
          const SizedBox(height: 40),
          const Text("Minhas fichas:", style: AppTextStyle.subText2),
          const SizedBox(height: 20),
          ...bottons,
          if (!thereIsCode)
            const Text("Não há fichas", style: AppTextStyle.subText1),
        ],
      ),
    );
  }
}
