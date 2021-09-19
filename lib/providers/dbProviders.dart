import 'package:KanjiMaru/models/ItemListModel.dart';
import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/providers/authProviders.dart';
import 'package:KanjiMaru/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Inject UID directly into Database instead of
//injecting into each function.
final db = Provider<Database>((ref) {
  String uid = ref.watch(currentUser) ?? "";
  return Database(uid: uid);
});

// Stream of defined list names
final definedListsName = StreamProvider<dynamic>((ref) {
  return ref
      .watch(db)
      .getDefinedListsName()
      .map((snapshot) => snapshot.data()['listNames']);
});

// Stream of user list names
final userListsName = StreamProvider<List>((ref) {
  return ref
      .watch(db)
      .getUserListsName()
      .map((snapshot) => snapshot.data()['listNames']);
});

// Stream of user lists
final userLists = StreamProvider<dynamic>((ref) {
  print('Starting grabbing user list.');
  return ref.watch(db).getUserLists().map((snapshot) => snapshot.docs
      .map((doc) => ItemList.fromFirestore({
            'name': doc.id,
            ...doc.data(),
          }))
      .toList());
});

final userSettings = StreamProvider<dynamic>((ref) {
  return ref
      .watch(db)
      .getUserSettings()
      .map((snapshot) => UserSettings.fromFirestore(snapshot.data()));
});

final userStatistics = StreamProvider<dynamic>((ref) {
  return ref
      .watch(db)
      .getUserStatistics()
      .map((snapshot) => UserStatistics.fromFirestore(snapshot.data()));
});


//Write provider for userStatistics Stream
//  Provider for lessonDailyGoal & reviewDailyGoal
//  Provider for displayName
//  Provider for currentActiveList
//  Provider for resetTime

//Write provider for userSettings Stream
//  Provider for both lessonsDone and reviewsDone