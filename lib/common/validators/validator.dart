class Validators {
  static String? numberValidatorCallback(String? str) {
    if (str != null && str.isNotEmpty) {
      final number = int.tryParse(str);
      if (number == null) {
        return "Please enter a valid number";
      }
    } else {
      return "Field should not be empty";
    }
    return null;
  }
}
