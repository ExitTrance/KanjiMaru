class ItemList {
  ItemList({this.listName = "", this.items = const []});
  String listName;
  List items;

  // Used for representing data from Firestore
  factory ItemList.fromFirestore(Map<String, dynamic> map) {
    return ItemList(
      listName: map['name'],
      items: map['data'].map((item) => Item.fromFirestoreMap(item)).toList(),
    );
  }

  // Used for representing data from a JSON File
  factory ItemList.fromFile(Map<String, dynamic> map) {
    return ItemList(
      listName: map['name'],
      items: map['notes'].map((note) => Item.fromFileMap(note)).toList(),
    );
  }

  Map returnMap() {
    return {
      "name": listName,
      "items": items.map((item) => item.toMap()).toList()
    };
  }
}

class Item {
  Item({
    this.reading = "",
    this.definition = "",
    this.furigana = "",
    this.section = "",
    this.wordType = "",
  });

  // Example Vocab Item
  // Based on Genki-1 Vocab

  // reading:       "今"
  // definition:    "now"
  // furigana:      "今[いま]"
  // section:       "4"
  // wordtype:      "noun"

  // reading
  String reading;

  // definition
  String definition;

  // Will contain the kanji readings
  // If there is no kanji, it will be the same as the vocab item
  String furigana;

  // tags[0] for genki
  String section;

  // If it's a noun/verb or just not specified
  String wordType;

  factory Item.fromFirestoreMap(Map<String, dynamic> data) {
    return Item(
      reading: data['reading'] ?? '',
      definition: data['definition'] ?? '',
      furigana: data['furigana'] ?? '',
      section: data['section'] ?? '',
      wordType: data['wordType'] ?? '',
    );
  }

  factory Item.fromFileMap(Map<String, dynamic> data) {
    return Item(
      reading: data['fields'][0],
      definition: data['fields'][1],
      furigana: data['fields'][2],
      section: data['tags'][0],
      wordType: data['tags'].length > 1 ? data['tags'][1] : "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reading': reading,
      'definition': definition,
      'furigana': furigana,
      'section': section,
      'wordType': wordType,
    };
  }
}
