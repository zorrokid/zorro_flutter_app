import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapp/models/todo.dart';

class AddNewPage extends StatefulWidget {
  AddNewPage({Key key, this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() => _AddNewPageState();
}

class Generation {
  num id;
  String description;
  Generation(this.id, this.description);
}

class _AddNewPageState extends State<AddNewPage> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _generations = <Generation>[
    Generation(1, "1"),
    Generation(2, "2"),
    Generation(3, "3"),
    Generation(4, "4"),
  ];
  
  Generation _selectedGeneration;
  String _description;

  @override
  void initState() {
    _selectedGeneration = _generations.first;
    super.initState();
  }

  
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text("Add new"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: myController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              }
            ),
            DropdownButton<Generation>(
              hint: Text("Select generation"),
              value: _selectedGeneration,
              items: _generations.map((Generation generation){
                return DropdownMenuItem<Generation>(
                    value: generation,
                    child: Text(generation.description),
                );
              }).toList(),
              onChanged: (Generation generation) {
                // print(newValue.description);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              // Create button inside Builder and use builder context to show snack bar to prevent the following error:
              // "Scaffold.of() called with a context that does not contain a Scaffold."
              // https://medium.com/@ksheremet/flutter-showing-snackbar-within-the-widget-that-builds-a-scaffold-3a817635aeb2
              child: Builder(
                  builder: (context) => RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Processing data")));
                          final todo = new Todo(myController.text, widget.userId, false);
                          _addNewTodo(todo);
                      }
                    },
                    child: Text("Submit"),
                  )
                ) 
              )
          ],
        )
      ),
    );
  }
  
  _addNewTodo(Todo todoItem) {
    _database.reference().child("todo").push().set(todoItem.toJson());
  }

}