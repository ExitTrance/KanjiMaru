class User {
  User({this.reviewSet, this.stats, this.settings});

  List<ReviewItem> reviewSet;
  Statistics stats;
  UserSettings settings;
}

class ReviewItem {
  ReviewItem({this.char = '', this.desc = ''});

  String char;
  String desc;
}

class Statistics {
  Statistics({this.kanjiLearned = 0, this.reviews = 0, this.vocabLearned = 0});

  int kanjiLearned;
  int reviews;
  int vocabLearned;
}

class UserSettings {
  UserSettings({this.reviewGoal = 100});

  int reviewGoal;
}
