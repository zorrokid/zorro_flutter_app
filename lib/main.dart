import 'package:flutter/material.dart';
import 'package:flutterapp/services/authentication.dart';
import 'package:flutterapp/pages/root_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterapp/state/app_state.dart';
import 'package:flutterapp/state/reducers.dart';
import 'package:flutterapp/state/middleware.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // https://blog.novoda.com/introduction-to-redux-in-flutter/
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware()
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
    store: this.store,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(auth: Auth(),),
    )
  );
}