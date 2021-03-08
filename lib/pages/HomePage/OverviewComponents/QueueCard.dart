import 'package:KanjiMaru/pages/HomePage/OverviewComponents/OverviewCard.dart';
import 'package:KanjiMaru/services/pad_white_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QueueCard extends StatelessWidget {
  const QueueCard({
    @required this.cardTheme,
    @required this.titleText,
    @required this.contentText,
    @required this.inQueue,
    @required this.buttonText,
    @required this.svgPath,
    @required this.buttonFunction,
    this.svgSemanticLabel = 'Icon',
  });

  final Color cardTheme;
  final String titleText;
  final String contentText;
  final int inQueue;
  final String buttonText;
  final String svgPath;
  final String svgSemanticLabel;
  final Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return OverviewCard(
      flex: 5,
      cardTheme: cardTheme,
      titleText: titleText,
      midContent: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(svgPath,
                    semanticsLabel: '$titleText $svgSemanticLabel'),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contentText,
                  style: TextStyle(fontSize: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: inQueue <= 10000
                            ? padWhiteSpace(inQueue, 6)
                            : '10000+',
                        style: TextStyle(
                          color: cardTheme,
                          fontFamily: 'B612Mono',
                        ),
                      ),
                      TextSpan(text: ' in queue'),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      buttonText: buttonText,
      buttonFunction: buttonFunction,
    );
  }
}
