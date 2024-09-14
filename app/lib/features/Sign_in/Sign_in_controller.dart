import 'dart:developer';
import 'package:app_flutter/features/Sign_in/Sign_in_state.dart';
import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier {
  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignIn() async {
    _changeState(SignInLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      //throw Exception('Erro ao logar');
      log('usuário logado');
      _changeState(SignInSucessState());
      return true;
    } catch (e) {
      _changeState(SignInErrorState());
      return false;
    }
  }
}
