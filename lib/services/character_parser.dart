import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadGraphicsAssets() async {
  return await rootBundle.loadString('assets/animCJK-master/graphicsJa.json');
}

Future<String> _loadDictionaryAssets() async {
  return await rootBundle.loadString('assets/animCJK-master/dictionaryJa.json');
}

Future loadGraphics() async {
  String jsonGraphics = await _loadGraphicsAssets();
  var graphicEntries = jsonDecode(jsonGraphics)['characters'];
  var graphics = Map.fromIterable(graphicEntries,
      key: (e) => e['character'], value: (e) => e);

  return graphics;
}

Future loadDictionary() async {
  String jsonDictionary = await _loadDictionaryAssets();
  var dictionaryEntries = jsonDecode(jsonDictionary)['characters'];
  var dictionary = Map.fromIterable(dictionaryEntries,
      key: (e) => e['character'], value: (e) => e);
  return dictionary;
}

Future<Map> loadCharacterData() async {
  var dictionary = await loadDictionary();
  var graphics = await loadGraphics();

  return {'dictionary': dictionary, 'graphics': graphics};
}
