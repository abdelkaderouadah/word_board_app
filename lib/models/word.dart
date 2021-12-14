class Word {
  final String word;
  final List<Meanings> meanings;

  Word({
    required this.word,
    required this.meanings,
  });
  factory Word.fromJson(Map<String, dynamic> json) {
    var list = json['meanings'] as List;
    List<Meanings> meaningsList =
        list.map((e) => Meanings.fromJson(e)).toList();
    return Word(
      word: json['word'],
      meanings: meaningsList,
    );
  }
}

class Meanings {
  final String partOfSpeech;
  final List<Definitions> definitions;

  Meanings({
    required this.partOfSpeech,
    required this.definitions,
  });
  factory Meanings.fromJson(Map<String, dynamic> json) {
    var list = json['definitions'] as List;
    List<Definitions> definitionsList =
        list.map((e) => Definitions.fromJson(e)).toList();
    return Meanings(
      partOfSpeech: json['partOfSpeech'],
      definitions: definitionsList,
    );
  }
}

class Definitions {
  final String definition;
  final String example;

  Definitions({
    required this.definition,
    required this.example,
  });
  factory Definitions.fromJson(Map<String, dynamic> json) {
    return Definitions(
      definition: json['definition'],
      example: json['example'],
    );
  }
}
