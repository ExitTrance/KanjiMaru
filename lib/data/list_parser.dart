import 'dart:convert';

import 'package:flutter/services.dart';

Future parseList() async {
  String json = await _loadList();
  var vocab = jsonDecode(json)['notes'];
  var map =
      Map.fromIterable(vocab, key: (e) => e['fields']['fields'], value: (e) => e);
  return map;
}

Future<String> _loadList() async {
  return await rootBundle.loadString('assets/animCJK-master/graphicsJa.json');
}
