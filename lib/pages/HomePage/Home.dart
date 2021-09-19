import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/models/ItemListModel.dart';
import 'package:KanjiMaru/pages/HomePage/DecksTab.dart';
import 'package:KanjiMaru/pages/HomePage/OverviewTab.dart';
import 'package:KanjiMaru/pages/HomePage/GamesTab.dart';
import 'package:KanjiMaru/pages/HomePage/StatisticsTab.dart';
import 'package:KanjiMaru/providers/authProviders.dart';
import 'package:KanjiMaru/providers/characterProviders.dart';
import 'package:KanjiMaru/providers/dbProviders.dart';
import 'package:KanjiMaru/providers/listProviders.dart';
import 'package:KanjiMaru/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  static Widget home(BuildContext context, ScopedReader watch) {
    double textSizeNav = 12.0;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16, bottom: 8),
      child: Column(
        children: [
          // Dashboard Text / Cup / Settings / Profile Picture
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(Icons.offline_pin),
                        onPressed: () {
                          watch(auth).signOut();
                          //Navigator.pushNamed(context, 'landing');
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(Icons.offline_pin),
                        onPressed: () {
                          /* watch(userListsName(watch(currentUser)!))
                              .whenData((value) => print(value)); */
                          /* watch(definedListsName)
                              .whenData((value) => print(value)); */
                          /* watch(userLists).whenData((value) => print(value));

                          watch(userSettings).whenData((value) => print(value));

                          watch(userStatistics).whenData(
                              (value) => print(value.reviewsDoneToday)); */

                          /* watch(definedListsName)
                              .whenData((value) => print(value.data()));
                          watch(userListsName(watch(currentUser)!))
                              .whenData((value) => print(value.data())); */

                          // Get all defined lists
                          /* Database()
                              .getDefinedLists()
                              .then((value) => print(value.docs[1].data())); */

                          // Add defined list
                          /* watch(genkiList).whenData((value) =>
                              Database().addDefinedList(value.returnMap())); */

                          // Add a defined list to user lists
                          /* Database().setDefinedListToUserList(
                              'Genki-2', watch(currentUser)!); */
                          /* Database().addCustomList(
                              'Genki-4',
                              {
                                'data': [
                                  {'世の中': 'The World.'},
                                  {'私': 'I/Me'},
                                ]
                              },
                              watch(currentUser)!); */

                          /* if (genkiUList.data == null) {
                            print("Currently empty.");
                          } else {
                            var count = 0;
                            var data = genki.data!.value.returnMap();
                            genkiUList.data!.value.docs.forEach((element) {
                              data['items'].forEach((map) => {
                                    if (map['reading'] ==
                                        element.data()!['reading'])
                                      {
                                        element.data()!.keys.forEach((key) {
                                          map[key] = element[key];
                                        })
                                      }
                                  });
                            });
                            //print(data);
                            //Database().addList(data);
                            //print(data);
                            //print(data['items']);
                            print(data['items'].where((map) => !!map.containsKey('learned')).toList());
                          } */

                          //print(watch(graphics));
                          //print(watch(dictionaryProvider));
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Greeting Text
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Align(
              child: Text(
                'おはよう！',
                style: TextStyle(fontSize: 24),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),

          // TabBar
          TabBar(
            indicatorPadding: EdgeInsets.only(top: 0),
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            indicatorColor: Color(0xFFEE892C),
            labelStyle: TextStyle(fontSize: textSizeNav),
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Decks'),
              Tab(text: 'Games'),
              Tab(text: 'Statistics'),
            ],
          ),

          // Tab Bar Items
          Expanded(
            child: TabBarView(children: [
              OverviewTab(),
              DecksTab(),
              games(context),
              StatisticsTab(),
            ]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        body: home(context, watch),
      ),
    );
  }
}
