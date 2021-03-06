import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    this.flex = 1,
    @required this.titleText,
    this.subText = "",
    @required this.midContent,
    this.buttonText = "Button",
    this.cardBackgroundColor = const Color(0xFF262A34),
    this.cardTheme = const Color(0xFF00C2FF),
    this.buttonAxisAlignment = MainAxisAlignment.center,
    @required this.buttonFunction,
  });
  final int flex;
  final String titleText;
  final String subText;
  final Widget midContent;
  final String buttonText;
  final Color cardBackgroundColor;
  final Color cardTheme;
  final MainAxisAlignment buttonAxisAlignment;
  final Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        color: Color(0xFF262A34),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: cardTheme, width: 6.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 9.0, left: 18, right: 18, bottom: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title Text
                Row(
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                        fontSize: 15,
                        color: cardTheme,
                      ),
                    ),
                  ],
                ),

                // Sub-text
                subText != ''
                    ? Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            subText,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    : Container(),

                // Content in the middle of the Card
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: midContent,
                ),

                // Button at the bottom of the Card
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    mainAxisAlignment: buttonAxisAlignment,
                    children: [
                      MaterialButton(
                        onPressed: buttonFunction,
                        color: cardTheme,
                        child: Text(buttonText, style: TextStyle(fontSize: 10)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
