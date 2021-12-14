class RandomWord {
  final String word;
  final String definition;
  final String pronunciation;
  RandomWord({
    required this.word,
    required this.definition,
    required this.pronunciation,
  });
  factory RandomWord.fromJson(Map<String, dynamic> json) {
    return RandomWord(
      word: json['word'],
      definition: json['definition'],
      pronunciation: json['pronunciation'],
    );
  }
}
