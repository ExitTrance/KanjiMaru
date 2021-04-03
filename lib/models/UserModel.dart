class User {
  User({this.stats, this.settings, this.userList});

  Statistics? stats;
  UserSettings? settings;
  UserList? userList;
}

class Statistics {
  Statistics({
    this.lessonsDone = 0,
    this.reviewsDone = 0,
    this.lastOnline,
  });

  int lessonsDone;
  int reviewsDone;

  DateTime? lastOnline;
}

class UserSettings {
  UserSettings({
    this.displayName = "",
    this.email = "",
    this.reviewDailyGoal = 50,
    this.lessonDailyGoal = 5,
    this.currentActiveLists = const [],
    this.resetTime = "0000",
  });

  String displayName;
  String email;

  int reviewDailyGoal;
  int lessonDailyGoal;

  List currentActiveLists;

  String resetTime;
}

class UserList {
  UserList({this.items = const {}});

  Map<String, UserListItem> items;
}

class UserListItem {
  UserListItem({
    this.status = 1,
    this.nextDueDate,
    this.reading = "",
    this.definition = "",
    this.furigana = "",
    this.containsKanji = "",
    this.listName = "",
    this.sectionTitle = "",
  });

  int status; // 1 - New / 2 - Learning / 3 - Waiting for Review / 4 - Reviewing
  DateTime? nextDueDate; // Some date time object
  String reading; // ex. "今"
  String definition; // ex. "now"
  String furigana; // ex. "今[いま]"
  String containsKanji; // ex. "y"

  String listName; // ex. "Genki-1"
  String sectionTitle; // ex. "1 - Meeting Friends"
}
