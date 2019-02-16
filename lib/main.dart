import 'package:flutter/material.dart';
import 'package:flutterapp/services/authentication.dart';
import 'package:flutterapp/pages/root_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutterapp/models/flutterapp_model.dart';

void main() {
  final appModel = FlutterAppModel();
  runApp(
    ScopedModel<FlutterAppModel>(
      model: appModel,
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(auth: Auth(),),
    );
  }
}