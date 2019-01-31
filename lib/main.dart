import 'package:flutter/material.dart';
import 'package:flutterapp/services/authentication.dart';
import 'package:flutterapp/pages/root_page.dart';

void main() => runApp(MyApp());

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