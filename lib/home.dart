import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/redux_service.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final store = Store<int>(ReduxActions.counterUpdate, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StoreConnector<int, String>(
          converter: (store) => store.state.toString(),
          builder: (context, count) {
            return Text(
              'The button has been pushed this many times: $count',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
      ),
      floatingActionButton: Container(
        color: Colors.red,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.Increment);
              },
              builder: (context, callback) {
                return IconButton(
                  onPressed: callback,
                  icon: Icon(Icons.add),
                );
              },
            ),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.Decrement);
              },
              builder: (context, callback) {
                return IconButton(
                  onPressed: callback,
                  icon: Icon(Icons.remove),
                );
              },
            ),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.Reset);
              },
              builder: (context, callback) {
                return IconButton(
                  onPressed: callback,
                  icon: Icon(Icons.restart_alt),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
