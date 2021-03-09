import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStream = StreamProvider<User>((ref) {
  return Database().getUserData;
});
