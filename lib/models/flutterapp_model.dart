import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutterapp/models/todo.dart';

class FlutterAppModel extends Model {
  final List<Todo> _items = [];

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_items);

  void add(Todo item) {
    _items.add(item);
    notifyListeners();
  }
}