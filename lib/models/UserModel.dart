class UserStatistics {
  UserStatistics({
    this.lessonsDone = 0,
    this.reviewsDone = 0,
    this.reviewsDoneToday = 0,
    this.lessonsDoneToday = 0,
    this.currentStreak = 0,
  });

  int lessonsDone;
  int reviewsDone;

  int lessonsDoneToday;
  int reviewsDoneToday;

  int currentStreak;
  factory UserStatistics.fromFirestore(Map<String, dynamic> map) {
    return UserStatistics(
      lessonsDone: map['lessonsDone'] ?? 0,
      reviewsDone: map['reviewsDone'] ?? 0,
      lessonsDoneToday: map['lessonsDoneToday'] ?? 0,
      reviewsDoneToday: map['reviewsDoneToday'] ?? 0,
      currentStreak: map['currentStreak'] ?? 0,
    );
  }
}

class UserSettings {
  UserSettings({
    this.displayName = "",
    this.email = "",
    this.reviewDailyGoal = 0,
    this.lessonDailyGoal = 0,
    this.currentActiveList = "",
  });

  String displayName;
  String email;

  int reviewDailyGoal;
  int lessonDailyGoal;

  String currentActiveList;

  factory UserSettings.fromFirestore(Map<String, dynamic> map) {
    return UserSettings(
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      reviewDailyGoal: map['reviewDailyGoal'] ?? 0,
      lessonDailyGoal: map['lessonDailyGoal'] ?? 0,
      currentActiveList: map['currentActiveList'] ?? '',
    );
  }
}
