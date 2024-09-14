import 'package:app_flutter/common/models/user_models.dart';

abstract class AuthServices {
  Future<UserModels> signUp({
    String? name,
    required String email,
    required String password,
  });
  Future signIn();
}
