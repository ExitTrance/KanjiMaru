import 'dart:convert';

import 'package:KanjiMaru/models/ItemListModel.dart';
import 'package:flutter/services.dart';

Future<ItemList> parseListTest() async {
  String json = await _loadList();
  var vocab = jsonDecode(json);
  return ItemList.fromFile(vocab);
}

Future<Map> parseList() async {
  String json = await _loadList();
  var vocab = jsonDecode(json)['notes'];
  var map =
      Map.fromIterable(vocab, key: (e) => e['fields'][0], value: (e) => e);

  return map;
}

Future<String> _loadList() async {
  return await rootBundle.loadString('assets/vocab_list/Genki_1/deck.json');
}
