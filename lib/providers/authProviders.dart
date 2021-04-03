import 'package:KanjiMaru/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final auth = Provider<Auth>((ref) {
  return Auth(FirebaseAuth.instance);
});

final currentUser = Provider<String?>((ref) {
  return ref.watch(auth).currentUser?.uid;
});
final authState = StreamProvider<User?>((ref) {
  return ref.watch(auth).authStateChanges;
});
