import 'package:KanjiMaru/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final Firestore _firestore = Firestore.instance;

  Stream<User> get getUserData {
    return _firestore
        .collection('users')
        .document(
            'ExitTrance') //TODO: Check user here and add login logic to this as well.
        .snapshots()
        .map(
          (DocumentSnapshot ds) => User(
            reviewSet: ds['reviewSet'].forEach((k, v) => [].add(ReviewItem(
                  char: v['char'] ?? '',
                  desc: v['desc'] ?? '',
                ))),
            stats: Statistics(
              kanjiLearned: ds['stats']['kanjiLearned'] ?? 0,
              reviews: ds['stats']['reviews'] ?? 1,
              vocabLearned: ds['stats']['vocabLearned'] ?? 0,
            ),
            settings: Settings(
              reviewGoal: ds['settings']['reviewGoal'] ?? 100,
            ),
          ),
        );
  }
}
