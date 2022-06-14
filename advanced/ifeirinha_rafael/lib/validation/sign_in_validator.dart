class SignInValidator {
  static String? validateEmail(String? email) {
    // String regex =
    //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //     r"{0,253}[a-zA-Z0-9])?)*$";
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
