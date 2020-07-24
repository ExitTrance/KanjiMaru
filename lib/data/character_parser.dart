import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadGraphicsAssets() async {
  return await rootBundle.loadString('assets/animCJK-master/graphicsJa.json');
}

Future<String> _loadDictionaryAssets() async {
  return await rootBundle.loadString('assets/animCJK-master/dictionaryJa.json');
}

Future loadGraphics() async {
  String jsonGraphics = await _loadGraphicsAssets();
  return jsonDecode(jsonGraphics)['characters'] as List;
}

Future loadDictionary() async {
  String jsonDictionary = await _loadDictionaryAssets();
  var dictionaryEntries = jsonDecode(jsonDictionary)['characters'] as List;
  List<DictionaryInfo> dictionaryEntriesObj =
      dictionaryEntries.map((entry) => DictionaryInfo.fromJson(entry)).toList();
  return dictionaryEntriesObj;
}

class GraphicsInfo {
  GraphicsInfo({
    @required this.character,
    @required this.strokes,
    @required this.medians,
  });
  String character;
  List<String> strokes;
  List<List<List<String>>> medians;

  factory GraphicsInfo.fromJson(dynamic json) {
    return GraphicsInfo(
      character: json['character'],
      strokes: json['strokes'],
      medians: json['medians'],
    );
  }

  @override
  String toString() {
    return '$character | $strokes';
  }
}

class DictionaryInfo {
  DictionaryInfo({
    @required this.character,
    @required this.sets,
    @required this.definitions,
    @required this.kuns,
    @required this.ons,
    @required this.radical,
    @required this.decomposition,
    @required this.acjk,
  });
  String character;
  List<dynamic> sets;
  String definitions;
  List<dynamic> kuns;
  List<dynamic> ons;
  String radical;
  String decomposition;
  String acjk;

  factory DictionaryInfo.fromJson(dynamic json) {
    return DictionaryInfo(
      character: json['character'],
      sets: json['set'],
      definitions: json['definition'],
      kuns: json['kun'],
      ons: json['on'],
      radical: json['radical'],
      decomposition: json['decomposition'],
      acjk: json['acjk'],
    );
  }

  @override
  String toString() {
    return '$character | $definitions';
  }
}
