import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brancoFosco,
      body: Center(
        child: Text("Página de pagamento", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
