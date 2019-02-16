import 'package:redux/redux.dart';
import 'package:flutterapp/state/app_state.dart';
import 'package:flutterapp/models/todo.dart';
import 'package:flutterapp/state/actions.dart';

AppState appReducer(AppState state, action) => AppState(todoListReducer(state.todos, action));

final Reducer<List<Todo>> todoListReducer = combineReducers([
  TypedReducer<List<Todo>, AddItemAction>(_addItem),
  TypedReducer<List<Todo>, RemoveItemAction>(_removeItem)
]);

List<Todo> _removeItem(List<Todo> todos, RemoveItemAction action) => List.unmodifiable(List.from(todos)..remove(action.item));
List<Todo> _addItem(List<Todo> todos, AddItemAction action) => List.unmodifiable(List.from(todos)..add(action.item));