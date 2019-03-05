import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutterapp/state/app_state.dart';
import 'package:flutterapp/state/actions.dart';
import 'package:flutterapp/state/reducers.dart';
import 'package:flutterapp/models/todo.dart';

void main() {
  test('Todo-item should be added to state in response to AddItemAction', () {
    final initialState = AppState.initial();
    final store = Store<AppState>(appReducer, initialState:initialState);    
    final item = new Todo('aaa', 'user-x', false);
    store.dispatch(AddItemAction(item));
    expect(store.state.todos.contains(item), true);
    expect(initialState.todos.contains(item), false);
  });
}