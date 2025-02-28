import 'package:app_flutter/common/constant/app_colors.dart';
import 'package:app_flutter/features/paymentPage/payment_page.dart';
import 'package:app_flutter/features/token/token_page.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = <Widget>[Token(), PaymentPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.azulEscuro2,
        fixedColor: AppColors.brancoFosco,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Money",
            backgroundColor: Colors.white,
          ),
          //BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
