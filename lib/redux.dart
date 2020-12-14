class AppState {
  final int count;
  AppState({this.count = 0});
}

abstract class Action {}

class Up extends Action {
  final int delta;
  Up(this.delta);
}

class Down extends Action {
  final int delta;
  Down(this.delta);
}

// TODO: dynamicにしなければエラーが出る。正確にはActionを入れるべき、気に入らない。
AppState reducer(AppState state, dynamic action) {
  if (action is Up) {
    return AppState(count: state.count + 1);
  } else if (action is Down) {
    return AppState(count: state.count - 1);
  } else {
    return state;
  }
}
