class Validator {
  static String? validateEmail(String? email) {
    String regex = '[\\w.-]+@[\\w-]+(\\.[a-z]+)+';
    RegExp regexMatcher = RegExp(regex);
    if (email == null || email.isEmpty || !regexMatcher.hasMatch(email)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty || password.trim().isEmpty) {
      return 'Digite uma senha válida';
    }
    return null;
  }
}
