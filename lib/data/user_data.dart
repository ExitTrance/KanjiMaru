class User {
  User({this.reviewSet, this.stats});

  List<ReviewItem> reviewSet;
  Statistics stats;
}

class ReviewItem {
  ReviewItem({this.char, this.desc});

  String char;
  String desc;
}

class Statistics {
  Statistics({this.kanjiLearned, this.reviews, this.vocabLearned});

  int kanjiLearned;
  int reviews;
  int vocabLearned;
}
