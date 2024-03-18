
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider with ChangeNotifier{
  static final StorageProvider _instance = StorageProvider._internal();

  StorageProvider._internal();

  factory StorageProvider() {
    return _instance;
  }

  SharedPreferences? preferences;
  init()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    preferences = prefs;
    notifyListeners();
  }

  saveData(String key, dynamic data)async{
  data =  await preferences?.setString(key, data);
  return true;
  }

getData(String key)async{
  return preferences?.getString(key);
}

removeData(String key)async{

  return preferences?.remove(key);
}

// // Save an integer value to 'counter' key.
//   await prefs.setInt('counter', 10);
// // Save an boolean value to 'repeat' key.
//   await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
//   await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
//   await prefs.setString('action', 'Start');
// // Save an list of strings to 'items' key.
//   await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}