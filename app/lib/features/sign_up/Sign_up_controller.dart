import 'package:app_flutter/features/sign_up/Sign_up_state.dart';
import 'package:app_flutter/services/auth_services.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  final AuthServices _services;
  SignUpController(this._services);
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    _changeState(SignUpLoadingState());
    try {
      await _services.signUp(
        email: email,
        password: password,
      );
      _changeState(SignUpSucessState());
      throw Exception('Erro ao logar');
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
