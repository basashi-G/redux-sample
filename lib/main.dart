import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux.dart';

void main(List<String> args) {
  final store = Store(reducer, initialState: AppState());
  return runApp(CounterApp(store));
}

class CounterApp extends StatelessWidget {
  final Store<AppState> store;
  CounterApp(this.store);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("current count"),
          StoreConnector<AppState, String>(
            converter: (store) => store.state.count.toString(),
            builder: (context, vm) => Text(vm),
          ),
          StoreConnector<AppState, Store>(
            converter: (store) => store,
            builder: (context, vm) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: () => vm.dispatch(Up(1)),
                  child: Icon(Icons.plus_one),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: () => vm.dispatch(Down(1)),
                  child: Icon(Icons.exposure_minus_1),
                  shape: CircleBorder(),
                )
              ],
            ),
          )
        ],
      )),
      appBar: AppBar(
        title: Text("Advaned Counter"),
      ),
    );
  }
}
