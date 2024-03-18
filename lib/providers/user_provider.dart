import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:group5_tutorial/providers/storage.dart';

import '../data/model/user.dart';

class UserProvider with ChangeNotifier {
  static final UserProvider _instance = UserProvider._internal();

  UserProvider._internal();

  factory UserProvider() {
    return _instance;
  }

  final storage = StorageProvider();

  User? user;

  addUser(User newUser) async {
    await storage.init();
    await storage.saveData("USER", json.encode(newUser.toJson()));
    user = newUser;
    notifyListeners();
  }

  Future<bool> editUser(User newUser) async {
    await storage.init();
    var info = await storage.getData(
      "USER",
    );
    if (info != null) {
      storage.removeData('USER');
      storage.saveData("USER", newUser);
      user = newUser;
      notifyListeners();
      return true;
    }
    return false;
  }

  getUser() async {
    await storage.init();
    return await storage.getData("USER");
  }
}
