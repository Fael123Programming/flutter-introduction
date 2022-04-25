class NumberValidator {
  bool isAValidNumber({required String numberStr}) {
    if (numberStr.isEmpty) {
      return false;
    }
    String digits = "0123456789";
    bool dotAlreadyPassed = false;
    for (int i = 0; i < numberStr.length; i++) {
      String currentChar = numberStr[i];
      if (!digits.contains(currentChar)) {
        if (currentChar == ".") {
          if (i == 0) {
            //A dot was encountered at the first index.
            return false;
          }
          if (dotAlreadyPassed) {
            //Two dots were met.
            return false;
          }
          dotAlreadyPassed = true;
        }
      }
    }
    return true;
  }
}
