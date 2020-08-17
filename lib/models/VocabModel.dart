class Vocab {}

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
}
