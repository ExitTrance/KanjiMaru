import 'package:KanjiMaru/pages/LandingPage.dart';
import 'package:KanjiMaru/pages/LoginPage/LoginPage.dart';
import 'package:KanjiMaru/pages/HomePage/Home.dart';
import 'package:KanjiMaru/pages/LoadingCharactersPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:stroke_order_animator/strokeOrderAnimationController.dart';
//import 'package:stroke_order_animator/strokeOrderAnimator.dart';
import 'package:flutter/material.dart';
import 'pages/StudyPage.dart';
import 'package:flutter/services.dart';

Map? dictionary;
Map? graphics;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoadingCharactersPage(),
        'landing': (context) => LandingPage(),
        'login': (context) => LoginPage(),
        'home': (context) => Home(),
        'study': (context) => StudyPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF000000),
        accentColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFF131522),
        fontFamily: 'OpenSans',
        cardColor: Color(0xFF8F22D9),
      ),
    );
  }
}

/* class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {
  PageController _pageController;
  int _selectedIndex = 0;

  List<StrokeOrderAnimationController> _strokeOrderAnimationControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _strokeOrderAnimationControllers = [
      StrokeOrderAnimationController(
        '{"strokes":["M482,585C500,685 508,735 521,761C527,776 522,785 512,792C473,817 447,828 426,820C415,817 412,810 419,797C437,765 451,702 428,571C423,545 423,545 421,532C416,508 404,438 362,353C355,340 347,328 340,315C297,248 216,173 141,114C129,106 118,97 107,87C96,79 95,74 106,73C116,73 136,76 162,90C224,126 261,151 302,190C336,224 355,248 379,281C389,297 399,313 408,330C436,391 456,449 475,547C480,572 480,572 482,585Z","M594,579C608,582 618,583 622,578C625,575 624,566 621,554C538,278 544,116 642,65C665,53 700,40 746,35C837,26 911,40 968,74C980,82 984,92 980,107C969,146 963,194 961,251C960,264 958,269 954,269C949,269 946,264 942,251C919,183 898,142 879,125C866,115 842,108 804,103C761,99 722,102 687,113C656,123 638,140 628,160C614,188 608,230 615,289C622,354 643,425 674,503C687,537 704,563 726,581C736,590 741,599 741,607C740,615 715,629 670,651C658,657 649,656 637,646C604,623 548,603 482,585C446,576 446,576 428,571C383,560 331,547 308,541C277,535 237,530 188,530C178,530 173,527 176,516C177,509 187,499 206,487C226,476 249,476 275,485C298,494 358,515 421,532C457,542 457,542 475,547C531,563 579,577 594,579Z","M463,214C466,214 472,216 477,222C483,231 483,249 473,272C465,291 437,315 408,330C379,345 379,345 364,353C334,369 304,380 284,389C278,392 275,390 275,382C274,374 277,367 285,361C290,357 312,340 340,315C366,292 366,292 379,281C419,246 459,215 463,214Z"],"medians":[[[422,808],[479,756],[446,524],[396,371],[290,210],[104,79]],[[182,520],[256,506],[622,610],[680,597],[616,427],[588,229],[617,125],[686,80],[802,68],[913,95],[940,120],[953,261]],[[281,383],[421,289],[470,220]]]}',
        this,
        onQuizCompleteCallback: (summary) {
          Fluttertoast.showToast(
              msg: [
            "Quiz finished. ",
            summary.nTotalMistakes.toString(),
            " mistakes",
          ].join());
        },
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _strokeOrderAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onAnimatorStateChanged() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Animator"),
      ),
      body: ChangeNotifierProvider<StrokeOrderAnimationController>.value(
        value: _strokeOrderAnimationControllers[_selectedIndex],
        child: Consumer<StrokeOrderAnimationController>(
            builder: (context, controller, child) {
          return Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  physics: controller.isQuizzing
                      ? NeverScrollableScrollPhysics()
                      : ScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    _strokeOrderAnimationControllers.length,
                    (index) => FittedBox(
                      child: StrokeOrderAnimator(
                        _strokeOrderAnimationControllers[index],
                        key: UniqueKey(),
                      ),
                    ),
                  ),
                  onPageChanged: (index) {
                    setState(() {
                      _strokeOrderAnimationControllers[_selectedIndex]
                          .stopAnimation();
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
              Flexible(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  primary: false,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: !controller.isQuizzing
                          ? () {
                              if (!controller.isAnimating) {
                                controller.startAnimation();
                              } else {
                                controller.stopAnimation();
                              }
                            }
                          : null,
                      child: controller.isAnimating
                          ? Text("Stop animation")
                          : Text("Start animation"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (!controller.isQuizzing) {
                          controller.startQuiz();
                        } else {
                          controller.stopQuiz();
                        }
                      },
                      child: controller.isQuizzing
                          ? Text("Stop quiz")
                          : Text("Start quiz"),
                    ),
                    MaterialButton(
                      onPressed: !controller.isQuizzing
                          ? () {
                              controller.nextStroke();
                            }
                          : null,
                      child: Text("Next"),
                    ),
                    MaterialButton(
                      onPressed: !controller.isQuizzing
                          ? () {
                              controller.previousStroke();
                            }
                          : null,
                      child: Text("Previous"),
                    ),
                    MaterialButton(
                      onPressed: !controller.isQuizzing
                          ? () {
                              controller.showFullCharacter();
                            }
                          : null,
                      child: Text("Show full character"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.reset();
                      },
                      child: Text("Reset"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.setShowOutline(!controller.showOutline);
                      },
                      child: controller.showOutline
                          ? Text("Hide outline")
                          : Text("Show Outline"),
                    ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     controller.setShowMedian(!controller.showMedian);
                    //   },
                    //   child: controller.showMedian
                    //       ? Text("Hide medians")
                    //       : Text("Show medians"),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     controller
                    //         .setHighlightRadical(!controller.highlightRadical);
                    //   },
                    //   child: controller.highlightRadical
                    //       ? Text("Unhighlight radical")
                    //       : Text("Highlight radical"),
                    // ),
                    MaterialButton(
                      onPressed: () async {
                        var dic = await loadDictionary();
                        print(dic['一']);
                      },
                      child: Text('Hello'),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
} */
