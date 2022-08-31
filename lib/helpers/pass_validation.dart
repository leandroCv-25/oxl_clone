bool passValidationUpperCase(String? pass) {
  if (pass == null) return false;
  final RegExp regex = RegExp(
    r'[A-Z]',
  );
  return pass.contains(regex);
}

bool passValidationNumber(String? pass) {
  if (pass == null) return false;
  final RegExp regex = RegExp(
    r'[0-9]',
  );
  return pass.contains(regex);
}

bool passValidationSymbol(String? pass) {
  if (pass == null) return false;
  final RegExp regex = RegExp(
    r'[$*&@#!|_]',
  );
  return pass.contains(regex);
}
