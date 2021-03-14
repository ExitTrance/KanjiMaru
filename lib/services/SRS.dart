import 'dart:math';
import 'package:flutter/foundation.dart';

class ReviewItem {
  ReviewItem({required this.character, required this.itemType});
  String character;

  //type of item [definition, character_write, recall]
  String itemType;

  //Can be: [New(default), Reviewing]
  String status = 'New';

  double difficulty = 0.3;
  double daysBetweenReviews = 1.0;
  DateTime dateLastReviewed = DateTime.now();

  late double percentOverdue;
  late double difficultyWeight;

  void calculatePercentOverdue(
      double performanceRating, bool correct, DateTime date) {
    percentOverdue = correct
        ? min(2.0,
            (date.difference(dateLastReviewed).inDays / daysBetweenReviews))
        : 1.0;
  }

  void calculateDifficulty(double performanceRating) {
    difficulty += percentOverdue * ((1 / 17) * (8 - 9 * performanceRating));
    difficulty = difficulty.clamp(0.0, 1.0);
  }

  void calculateDifficultyWeight() {
    difficultyWeight = 3.0 - 1.7 * difficulty;
  }

  void calculateDaysBetweenReviews(bool correct) {
    daysBetweenReviews *= correct
        ? 1 + (difficultyWeight - 1.0) * percentOverdue
        : max(1, 1 / pow(difficultyWeight, 2));
  }

  void calculate(double performanceRating, DateTime date) {
    //Calc correctness
    bool correct = performanceRating >= 0.6;

    calculatePercentOverdue(performanceRating, correct, date);
    calculateDifficulty(performanceRating);
    calculateDifficultyWeight();
    calculateDaysBetweenReviews(correct);

    dateLastReviewed = date;
  }

  @override
  String toString() {
    return 'Character: $character | Percent Over Due: $percentOverdue | DaysBtwnReview: $daysBetweenReviews | Diff: $difficulty | LastRev: $dateLastReviewed';
  }
}
