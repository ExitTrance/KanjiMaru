import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map> parseList() async {
  String json = await _loadList();
  var vocab = jsonDecode(json)['notes'];
  var map =
      Map.fromIterable(vocab, key: (e) => e['fields'][0], value: (e) => e);
  return map;
}

Future<String> _loadList() async {
  return await rootBundle.loadString('assets/vocab_list/Genki-1-2ndEdition.json');
}
