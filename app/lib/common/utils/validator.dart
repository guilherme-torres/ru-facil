class Validator {
  Validator._();

  static String? validatorNome(value) {
    if (value != null && value.isEmpty) {
      return 'Preencha este campo';
    }
    return null;
  }

  static String? validatorEmail(value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (value != null && value.isEmpty) {
      return 'Preencha este campo';
    }
    if (value != null && !value.contains(condition)) {
      return 'Email inválido';
    }
    return null;
  }

  static String? validatorSenha(value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return 'Preencha este campo';
    }
    if (value != null && !value.contains(condition)) {
      return 'Senha inválida';
    }
    return null;
  }

  static String? validatorConfimarSenha(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return 'Preencha este campo';
    }
    if (first != second) {
      return 'senhas diferentes';
    }
    return null;
  }
}
