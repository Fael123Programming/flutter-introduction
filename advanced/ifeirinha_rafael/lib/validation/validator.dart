class Validator {
  static String? validateEmail(String? email) {
    String regex = '[\\w.-]+@[\\w-]+(\\.[a-z]+)+';
    RegExp regexMatcher = RegExp(regex);
    if (email == null ||
        email.isEmpty ||
        !regexMatcher.hasMatch(email) ||
        hasSpace(email)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null ||
        password.isEmpty ||
        hasSpace(password) ||
        password.length < 8 ||
        isPasswordUnsafe(password)) {
      return 'Digite uma senha válida';
    }
    return null;
  }

  static String? validatePasswordSpecialMsg(String? password) {
    if (password == null ||
        password.isEmpty ||
        hasSpace(password) ||
        password.length < 8 ||
        isPasswordUnsafe(password)) {
      return 'Use oito ou mais caracteres com uma combinação de letras, números e símbolos';
    }
    return null;
  }

  static String? comparePasswords(String? password1, String? password2) {
    if (password1 != password2) {
      return 'Ambas as senhas devem ser iguais';
    }
    return null;
  }

  static bool hasSpace(String str) {
    return str.contains(' ');
  }

  static bool isPasswordUnsafe(String password) {
    return !password.contains(RegExp(r'[0-9]')) &&
        (!password.contains(RegExp(r'[a-z]')) ||
            !password.contains(RegExp(r'[A-Z]')));
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty || name.trim().isEmpty) {
      return 'Digite um nome válido';
    }
    return null;
  }
}
