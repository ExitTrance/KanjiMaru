import 'package:KanjiMaru/models/ItemListModel.dart';
import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Inject UID directly into Database instead of
//injecting into each function.
final db = Provider<Database>((ref) {
  return Database();
});

// Stream of defined list names
final definedListsName = StreamProvider<dynamic>((ref) {
  return ref
      .watch(db)
      .getDefinedListsName()
      .map((snapshot) => snapshot.data()['listNames']);
});

// Stream of user list names
final userListsName = StreamProvider.family<List, String>((ref, uid) {
  return ref
      .watch(db)
      .getUserListsName(uid)
      .map((snapshot) => snapshot.data()['listNames']);
});

// Stream of user lists
final userLists = StreamProvider.family<List<ItemList>, String>((ref, uid) {
  print('Starting grabbing user list.');
  return ref.watch(db).getUserLists(uid).map((snapshot) => snapshot.docs
      .map((doc) => ItemList.fromFirestore({
            'name': doc.id,
            ...doc.data(),
          }))
      .toList());
});
