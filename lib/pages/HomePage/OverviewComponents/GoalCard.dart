import 'package:KanjiMaru/pages/HomePage/OverviewComponents/OverviewCard.dart';
import 'package:KanjiMaru/services/pad_white_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    required this.cardTheme,
    required this.titleText,
    required this.currentStreak,
    this.lessonsRemaining = 0,
    this.reviewsRemaining = 0,
    required this.buttonText,
    required this.buttonFunction,
    required this.svgPath,
    required this.svgSize,
    this.semanticLabel = "Icon",
    required this.radiusOuter,
    required this.radiusInner,
    required this.progressOuter,
    required this.progressInner,
    required this.lessonColor,
    required this.reviewColor,
  });

  final Color cardTheme;
  final String titleText;
  final int currentStreak;
  final int lessonsRemaining;
  final int reviewsRemaining;

  final String buttonText;
  final Function buttonFunction;

  final String svgPath;
  final double svgSize;
  final String semanticLabel;

  final double radiusOuter;
  final double radiusInner;

  final double progressOuter;
  final double progressInner;

  final Color lessonColor;
  final Color reviewColor;

  @override
  Widget build(BuildContext context) {
    return OverviewCard(
      flex: 7,
      cardTheme: cardTheme,
      titleText: titleText,
      subText: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: 'You are currently on a '),
            TextSpan(
              text: '$currentStreak',
              style: TextStyle(
                color: cardTheme,
              ),
            ),
            TextSpan(text: ' day streak!'),
          ],
          style: TextStyle(fontSize: 10),
        ),
      ),
      buttonText: buttonText,
      buttonFunction: buttonFunction,
      midContent: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: radiusOuter,
                  lineWidth: 6.0,
                  percent: progressOuter.clamp(.0, 1.0),
                  center: CircularPercentIndicator(
                    radius: radiusInner,
                    lineWidth: 6.0,
                    percent: progressInner.clamp(.0, 1.0),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: svgSize,
                          height: svgSize,
                          child: SvgPicture.asset(svgPath,
                              semanticsLabel: '$titleText $semanticLabel'),
                        ),
                      ],
                    ),
                    progressColor: lessonColor,
                    backgroundColor: Color(0xFF363B49),
                    backgroundWidth: 3,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  progressColor: reviewColor,
                  backgroundColor: Color(0xFF363B49),
                  backgroundWidth: 3,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lessons',
                      style: TextStyle(fontSize: 12),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: lessonsRemaining <= 1000
                              ? padWhiteSpace(lessonsRemaining, 5)
                              : '1000+',
                          style: TextStyle(
                            color: lessonColor,
                            fontFamily: 'B612Mono',
                          ),
                        ),
                        TextSpan(
                          text: ' remaining',
                          style: TextStyle(),
                        ),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(fontSize: 12),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: reviewsRemaining <= 1000
                                ? padWhiteSpace(reviewsRemaining, 5)
                                : '1000+',
                            style: TextStyle(
                              color: reviewColor,
                              fontFamily: 'B612Mono',
                            ),
                          ),
                          TextSpan(text: ' remaining'),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
