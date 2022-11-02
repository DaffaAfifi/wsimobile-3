import 'package:hive_flutter/adapters.dart';

class UserHiveDatabase {
  final userBox = Hive.box("users");
  List users = [];
  int? userId;

  createInit(){
    users.add([this.users.length + 1,
      "daffafifi",
      "123",
      "Hahaha",
      "08210838204"]);
    this.updateDB();
  }

  loadDB() {
    users = userBox.get("user");
    userId = userBox.get("userId");
  }

  updateDB() {
    userBox.put("user", users);
    userBox.put("userId", userId);
  }
}