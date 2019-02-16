import 'package:flutterapp/models/todo.dart';

class AppState {
  final List<Todo> todos;

  AppState(this.todos);

  factory AppState.initial() => AppState(List.unmodifiable([]));
}