import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter login demo"),
      ),
      body: Container(
        child: Text("Hello world"),
      ),
    );
  }
}