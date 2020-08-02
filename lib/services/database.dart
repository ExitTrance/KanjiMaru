import 'package:KanjiMaru/data/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final Firestore _firestore = Firestore.instance;

  Stream<User> get getUserData {
    return _firestore
        .collection('users')
        .document('ExitTrance')
        .snapshots()
        .map(
          (DocumentSnapshot ds) => User(
            reviewSet: ds['review_set'].forEach((k, v) => [].add(ReviewItem(
                  char: v['char'] ?? '',
                  desc: v['desc'] ?? '',
                ))),
            stats: Statistics(
              kanjiLearned: ds['stats']['kanji_learned'] ?? 0,
              reviews: ds['stats']['reviews'] ?? 0,
              vocabLearned: ds['stats']['vocab_learned'] ?? 0,
            ),
          ),
        );
  }
}
