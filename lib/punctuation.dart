bool isPunctation(String char) {
  int startOfUppercaseLetters = 65;
  int endOfUppercaseLetters = 90;
  int startOfLowercaseletters = 97;
  int endOfLowercaseLetters = 122;
  int codePoint = char.codeUnitAt(0);

  bool isUppercaseCharacter = codePoint >= startOfUppercaseLetters &&
      codePoint <= endOfUppercaseLetters;
  bool isLowercaseCharacter = codePoint >= startOfLowercaseletters &&
      codePoint <= endOfLowercaseLetters;

  if (!isUppercaseCharacter && !isLowercaseCharacter) {
    return true;
  }
  return false;
}
