bool zipValidation(String? zip) {
  if (zip == null || zip.isEmpty) {
    return false;
  } else {
    final clearZip = zip.replaceAll(RegExp('[^0-9]'), '');
    if (clearZip.length != 8) return false;
    return true;
  }
}

String zipClean(String zip) => zip.replaceAll(RegExp('[^0-9]'), '');
