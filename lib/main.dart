import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/home.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/redux_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: Store<int>(ReduxActions.counterUpdate, initialState: 0),
      child: MaterialApp(
        title: 'Material App',
        home: Home(),
      ),
    );
  }
}
