import 'dart:async';
import 'package:redux/redux.dart';
import 'package:flutterapp/state/app_state.dart';
import 'package:flutterapp/state/actions.dart';

List<Middleware<AppState>> createStoreMiddleware() => [
  TypedMiddleware<AppState, GetItemsAction>(_getItems)
];

Future _getItems(Store<AppState> store, GetItemsAction action, NextDispatcher next) async {
  await Future.sync(() => Duration(seconds: 3)); // simulate fetch
  next(action);
}
