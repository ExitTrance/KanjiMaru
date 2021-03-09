import 'package:KanjiMaru/services/character_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characters = FutureProvider<Map<dynamic, dynamic>>((ref) async {
  return await loadCharacterData();
});

final dictionary = Provider<Map>((ref) {
  final AsyncData<Map> dic = ref.watch(characters).data;
  return dic.value['dictionary'];
});

final graphics = Provider<Map>((ref) {
  final AsyncData<Map> dic = ref.watch(characters).data;
  return dic.value['graphics'];
});
