/* import 'package:KanjiMaru/providers/characterProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingUserDataPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<Map> characterMap = watch(characters);
  
    return Scaffold(
      body: StreamBuilder(
        stream: stream ,
        initialData: initialData ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            child: child,
          );
        },
      ),
    );
  }
}
 */