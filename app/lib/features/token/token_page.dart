import 'package:app_flutter/common/constant/routes.dart';
import 'package:app_flutter/common/variable/token_codes.dart';
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
  late List<Widget> bottons;

  @override
  void initState() {
    super.initState();

    bottons = List.generate(5, (index) {
      if (codeList[index] != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Tokens(
                  onPressed: () {
                    setState(() {
                      currentIndex = index;
                    });
                    Navigator.pushNamed(context, NamedRoutes.qrcode);
                  },
                  index: index,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        );
      } else {
        return SizedBox();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool thereIsCode = codeList.any((code) => code != null);

    return Scaffold(
      backgroundColor: AppColors.brancoDeBackground,
      body: ListView(
        padding: EdgeInsets.only(left: 15.0),
        children: [
          const SizedBox(height: 80),
          Text(
            "Olá, fulano!",
            style: AppTextStyle.bigText1.copyWith(color: AppColors.azulEscuro2),
          ),
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
