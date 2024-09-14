import 'package:app_flutter/common/models/user_models.dart';
import 'package:app_flutter/services/auth_services.dart';

class MockAuthService implements AuthServices {
  @override
  Future signIn() {
    throw UnimplementedError();
  }

  @override
  Future<UserModels> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModels(
        id: email.hashCode,
        email: email,
        password: password,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Tente uma senha mais forte.';
      }
      throw 'Não foi possível criar a sua conta no momento.';
    }
  }
}
