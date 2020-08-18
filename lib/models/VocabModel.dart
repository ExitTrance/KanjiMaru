class Vocab {
  Vocab({this.vocabListName = "", this.vocab = const []});
  String vocabListName;
  List vocab;

  factory Vocab.fromJson(Map<String, dynamic> map) {
    return Vocab(
      vocabListName: map['name'],
      vocab: map['notes'].map((note) => VocabItem.fromMap(note)).toList(),
    );
  }
}

///something
class VocabItem {
  VocabItem({
    this.vocabType,
    this.reading,
    this.definition,
    this.furigana,
    this.containsKanji,
    this.section,
    this.wordType,
  });

  // Example Vocab Item
  //

  // vocabType:     "definition"
  // reading:       "今"
  // definition:    "now"
  // furigana:      "今[いま]"
  // containsKanji: "y"
  // section:       "4"
  // section:       ""

  //Can either be definition(JP -> ENG) or recall (ENG -> JP)
  String vocabType;

  ///reading
  String reading;

  String definition;

  //Will contain the kanji readings
  //If there is no kanji, it will be the same as the vocab item
  String furigana;

  //Can either be 'y' for it does contain a kanji
  //Or the empty string to indicate hiragana/katakana only
  String containsKanji;

  //Tags[0] for genki
  String section;

  //If it's a noun/verb or just not specified
  String wordType;

  factory VocabItem.fromMap(Map<String, dynamic> data) {
    return VocabItem(
      vocabType: data[''],
      reading: data['fields'][0],
      definition: data['fields'][1],
      furigana: data['fields'][2],
      containsKanji: data['fields'][3],
      section: data['tags'][0],
      wordType: data[''],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      reading: {
        'vocabType': vocabType,
        'reading': reading,
        'definition': definition,
        'furigana': furigana,
        'containsKanji': containsKanji,
        'section': section,
        'wordType': wordType,
      }
    };
  }
}
