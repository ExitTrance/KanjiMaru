import 'package:KanjiMaru/models/ItemListModel.dart';
import 'package:KanjiMaru/services/list_parser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:KanjiMaru/services/database.dart';

final genkiList = FutureProvider<ItemList>((ref) async {
  return await parseListTest();
});

/* final userList = FutureProvider<QuerySnapshot>((ref) async {
  return await Database().getUserList();
}); */
