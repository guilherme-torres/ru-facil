import 'package:app_flutter/common/variable/token_codes.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:app_flutter/common/constant/app_colors.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brancoFosco,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              color: AppColors.azulEscuro2,
              iconSize: 50,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Center(
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              width: 330,
              height: 440,
            ),
          ),
          Positioned(
            top: 210,
            left: 120,
            child: Text(
              codeList[currentIndex]!,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 280),
              child: PrettyQrView.data(data: codeList[currentIndex]!),
            ),
          ),
        ],
      ),
    );
  }
}
