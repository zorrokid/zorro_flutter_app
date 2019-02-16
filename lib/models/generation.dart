import 'package:firebase_database/firebase_database.dart';

class Generation {
  String key;
  String description;
  Generation(this.key, this.description);

  Generation.fromSnapshot(DataSnapshot snapshot) : 
    key = snapshot.key,
    description = snapshot.value["description"];

  toJson() {
    return {
      "description": description
    };
  }
}