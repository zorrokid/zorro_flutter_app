import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;
  FormMode _formMode = FormMode.LOGIN;

  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter login demo"),
      ),
      body: Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress()
        ]
      ),
    );
  }

  @override initState() {
    _isLoading = false;
    super.initState();
  }

  Widget _showCircularProgress() {
    if (_isLoading == true) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(height: 0.0, width: 0.0);
  }

  Widget _showBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _showLogo(),
            _showEmailInput(),
            _showPasswordInput(),
            _showPrimaryButton(),
            _showSecondaryButton()
          ],
        ),
      ),
    );    
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/flutter-icon.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey
          )
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      )
    );
  } 

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: Colors.grey
          )
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      )
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: Colors.blue,
        child: _formMode == FormMode.LOGIN
          ? Text('Login', style: TextStyle(fontSize: 20.0, color: Colors.white))
          : Text('Create account', style: TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: _validateAndSubmit,
      ),
    );
  }

  Widget _showSecondaryButton() {
    return FlatButton(
      child: _formMode == FormMode.LOGIN
        ? Text('Create an account', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
        : Text('Have an account? Sign in', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN
        ? _changeFormToSignUp
        : _changeFormToLogin,
    );
  }

  _validateAndSubmit() {
    return true;
  }

  _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
     _formMode = FormMode.SIGNUP; 
    });
  }

  _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
     _formMode = FormMode.LOGIN; 
    });
  }
}