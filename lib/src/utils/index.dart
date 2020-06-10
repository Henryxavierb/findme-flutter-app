ellipses(String word) {
  if (word.length > 29) {
    var wordEllipsed = word.substring(0, 29);
    return '$wordEllipsed...';
  }

  return word;
}

removeSpaceWord(String word) {
  return word.replaceAll(" ", '');
}
